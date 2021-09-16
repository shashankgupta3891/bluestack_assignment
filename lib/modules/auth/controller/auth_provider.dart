import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
// import 'package:toast/toast.dart';

// import '../../../core/services/api/main_api_services.dart';
import '../../../locator.dart';
// import '../../dashboard/model/user_model.dart';
// import '../../dashboard/screens/dashboard.dart';
// import '../screens/login_screen.dart';

class AuthProvider with ChangeNotifier {
  // UserModel _userModel;
  // UserModel get userModel => _userModel;

  // final MainAPIServices _mainAPIServices = locator.get<MainAPIServices>();

  // Future<void> signIn(BuildContext context,
  //     {@required String email, @required String password}) async {
  //   // debugPrint("AuthProvider SignIn called");

  //   dio.Response response;
  //   try {
  //     response =
  //         await _mainAPIServices.signIn(email: email, password: password);

  //     if (response?.statusCode == 200) {
  //       UserModel user;
  //       user =
  //           UserModel.fromJson(response?.data['user'] as Map<String, dynamic>);
  //       _userModel = user;

  //       Navigator.pushNamedAndRemoveUntil(
  //           context, DashboardScreen.routeName, (route) => false);
  //     } else {
  //       final String msg = response?.statusMessage ?? "Some Error";

  //       Toast.show(msg, context,
  //           duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  //     }
  //   } on dio.DioError catch (e) {
  //     final String msg = e?.response?.statusMessage ?? "Some Error";

  //     Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
  //   } catch (e) {
  //     // debugPrint(e.toString());

  //     final String msg = e?.response?.statusCode == 404
  //         ? "Email or Password is incorrect"
  //         : e?.response?.statusMessage as String;

  //     Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
  //   }
  // }

  // Future<void> getUserDetails(BuildContext context) async {
  //   // debugPrint("AuthProvider getUserDetails called");

  //   dio.Response response;
  //   try {
  //     _userModel = null;

  //     response = await locator.get<MainAPIServices>().userDetails();

  //     if (response?.statusCode == 200) {
  //       UserModel user;
  //       user =
  //           UserModel.fromJson(response?.data['user'] as Map<String, dynamic>);
  //       _userModel = user;

  //       Navigator.pushNamedAndRemoveUntil(
  //           context, DashboardScreen.routeName, (route) => false);
  //     } else {
  //       final String msg = response?.statusMessage ?? "Some Error";
  //       Navigator.pushNamedAndRemoveUntil(
  //           context, LoginScreen.routeName, (route) => false);
  //       Toast.show(msg, context,
  //           duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  //     }
  //   }
  //   //  on dio.DioError catch (e) {
  //   //   final String msg = e?.response?.statusMessage ?? "Some Error";

  //   //   Navigator.pushNamedAndRemoveUntil(
  //   //       context, LoginScreen.routeName, (route) => false);

  //   //   Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
  //   // }

  //   catch (e) {
  //     // debugPrint(e.toString());

  //     // final String msg = e?.response?.statusCode == 404
  //     //     ? "Email or Password is incorrect"
  //     //     : e?.response?.statusMessage as String;

  //     Future.delayed(
  //       const Duration(seconds: 2),
  //       () => Navigator.pushNamedAndRemoveUntil(
  //         context,
  //         LoginScreen.routeName,
  //         (route) => false,
  //       ),
  //     );

  //     // Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
  //   }
  // }

  // Future<void> logout(BuildContext context) async {
  //   // debugPrint("AuthProvider logout called");

  //   await _mainAPIServices.logout();

  //   _userModel = null;

  //   Navigator.pushNamedAndRemoveUntil(
  //       context, LoginScreen.routeName, (route) => false);
  // }
}
