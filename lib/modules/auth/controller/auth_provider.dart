import 'package:bluestack_assignment/core/api_repository/auth_api_repository.dart';
import 'package:bluestack_assignment/modules/auth/model/user_model.dart';
import 'package:bluestack_assignment/modules/home/view/home_screen.dart';
import 'package:dio/dio.dart';
// import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import '../../../locator.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  final AuthApiRepository _apiRepository = locator.get<AuthApiRepository>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(
    BuildContext context, {
    VoidCallback? onSuccess,
    VoidCallback? onError,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      Response response = await _apiRepository.login();

      _userModel =
          UserModel.fromJson(response.data["data"] as Map<String, dynamic>);

      onSuccess?.call();

      await Future.delayed(const Duration(seconds: 2));

      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    } on DioError catch (e) {
      debugPrint(e.message);
      // print("e.message");
      // print(e.message);
      // final String msg = e.response?.statusMessage ?? "Some Error";

      onError?.call();

      // Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);

      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
          content: Text(e.message),
          actions: [TextButton(onPressed: () {}, child: const Text("Ok"))]));
    } catch (e) {
      debugPrint(e.toString());

      onError?.call();
      // debugPrint(e.toString());

      // final String msg = e?.response?.statusCode == 404
      //     ? "Email or Password is incorrect"
      //     : e?.response?.statusMessage as String;

      // Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }
}
