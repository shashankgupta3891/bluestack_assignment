import 'package:bluestack_assignment/core/service/internal_storage_service.dart';
import 'package:bluestack_assignment/modules/auth/controller/auth_provider.dart';
import 'package:bluestack_assignment/modules/auth/view/drawer/drawer.dart';
import 'package:bluestack_assignment/modules/home/controller/home_provider.dart';
import 'package:bluestack_assignment/modules/home/view/section/profile_view.dart';
import 'package:bluestack_assignment/common.dart';
import 'package:tuple/tuple.dart';

import 'section/tournament_grid_section.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InternalStorage internalStorage = InternalStorage();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await context.read<HomeProvider>().fetchInitialList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final HomeProvider tournamentProvide = context.read<HomeProvider>();

    final AuthProvider authProvider = context.read<AuthProvider>();
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: const Text('Flyingwolf'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authProvider.logout(context),
          ),
        ],
        elevation: 0,
      ),
      body: Selector<HomeProvider, Tuple2<bool, bool>>(
        selector: (_, provider) => Tuple2(provider.isLoading, provider.canNext),
        builder: (context, listener, _) {
          final bool isLoading = listener.item1;
          final bool canNext = listener.item2;

          bool onNotification(ScrollNotification scrollNotification) {
            if (!isLoading &&
                scrollNotification is ScrollUpdateNotification &&
                scrollNotification.metrics.pixels ==
                    scrollNotification.metrics.maxScrollExtent) {
              if (tournamentProvide.canNext) {
                tournamentProvide.fetchNext();
              }

              debugPrint(tournamentProvide.tournamentsList.length.toString());

              debugPrint(isLoading.toString());
            }
            return true;
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isLoading) const LinearProgressIndicator(),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: onNotification,
                  child: Scrollbar(
                    isAlwaysShown: true,
                    thickness: 8,
                    radius: const Radius.circular(4),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const ProfileView(),
                          const TournamentGridSection(),
                          if (canNext)
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
