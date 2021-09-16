import 'package:bluestack_assignment/modules/auth/view/login_screen.dart';
import 'package:bluestack_assignment/modules/home/controller/tournament_provider.dart';
import 'package:bluestack_assignment/modules/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:manufapp/modules/auth/controllers/auth_provider.dart';
// import 'package:manufapp/utils/components/util_components_src.dart';
import 'package:provider/provider.dart';

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
      // context.read<AuthProvider>().getUserDetails(context);

      await Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushNamedAndRemoveUntil(
          LoginScreen.routeName,
          (route) => false,
        ),
      );
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
              // const CompanyLogo(),
              SpinKitFadingCircle(
                  color: Theme.of(context).primaryColor, size: 70),
            ],
          ),
        ),
      ),
    );
  }
}
