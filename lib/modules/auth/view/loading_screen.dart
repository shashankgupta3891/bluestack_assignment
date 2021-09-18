import 'package:bluestack_assignment/core/constant/image_src_constant.dart';
import 'package:bluestack_assignment/core/service/internal_storage_service.dart';
import 'package:bluestack_assignment/modules/auth/controller/auth_provider.dart';
import 'package:bluestack_assignment/modules/auth/view/login_screen.dart';
import 'package:bluestack_assignment/modules/home/view/home_screen.dart';

import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:bluestack_assignment/common.dart';

import 'package:tuple/tuple.dart';

class LoadingScreen extends StatefulWidget {
  static const String routeName = '/';

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      //It will give delay on loading.
      final AuthProvider authProvider = context.read<AuthProvider>();

      InternalStorage internalStorage = InternalStorage();

      final bool hasCredentials = internalStorage.hasLoginCredentials();

      if (hasCredentials) {
        final Tuple2<String?, String?> credentials =
            internalStorage.getLoginCredentials();

        debugPrint(
            credentials.item1.toString() + "  " + credentials.item2.toString());

        authProvider.login(
          userId: credentials.item1 ?? "",
          password: credentials.item2 ?? "",
          onSuccess: () => Navigator.of(context).pushNamedAndRemoveUntil(
            HomeScreen.routeName,
            (route) => false,
          ),
          onError: (String errMassage) async {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(errMassage)));
            await Navigator.of(context).pushNamedAndRemoveUntil(
              LoginScreen.routeName,
              (route) => false,
            );
          },
        );
      } else {
        await Future.delayed(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushNamedAndRemoveUntil(
            LoginScreen.routeName,
            (route) => false,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Image.asset(KImageConstant.companyLogo)),
              SpinKitFadingCircle(
                  color: Theme.of(context).primaryColor, size: 70),
            ],
          ),
        ),
      ),
    );
  }
}
