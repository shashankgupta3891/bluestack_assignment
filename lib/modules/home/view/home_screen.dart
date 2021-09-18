import 'package:bluestack_assignment/core/service/internal_storage_service.dart';
import 'package:bluestack_assignment/modules/auth/controller/auth_provider.dart';
import 'package:bluestack_assignment/modules/auth/view/drawer/drawer.dart';
import 'package:bluestack_assignment/modules/home/controller/tournament_provider.dart';
import 'package:bluestack_assignment/modules/home/view/section/profile_view.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
      await context.read<TournamentProvider>().getTournamentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TournamentProvider tournamentProvide =
        context.read<TournamentProvider>();
    final AuthProvider authProvider = context.read<AuthProvider>();
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Flyingwolf',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authProvider.logout(context),
          ),
        ],
        elevation: 0,
        // leading: const Icon(Icons.menu),
      ),
      body: Selector<TournamentProvider, bool>(
        selector: (_, tournamentProvider) => tournamentProvider.isLoading,
        builder: (context, isLoading, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isLoading ? const LinearProgressIndicator() : Container(),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification sn) {
                    if (!isLoading &&
                        sn is ScrollUpdateNotification &&
                        sn.metrics.pixels == sn.metrics.maxScrollExtent) {
                      if (tournamentProvide.canNext) {
                        tournamentProvide.fetchNext();
                      }

                      print(tournamentProvide.tournamentsList.length);
                      // setState(() {
                      //   this.isLoading = true;
                      // });
                      // widget.onNextPage?.call(currentPage++)?.then((bool isLoaded) {
                      //   setState(() {
                      //     this.isLoading = false;
                      //   });
                      // });

                      debugPrint(isLoading.toString());
                    }
                    return true;
                  },
                  child: child ?? Container(),
                ),
              ),
            ],
          );
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: const [
              ProfileView(),
              TournamentGridSection(),
            ],
          ),
        ),
      ),
    );
  }
}
