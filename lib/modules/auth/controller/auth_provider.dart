import 'package:bluestack_assignment/core/api_repository/auth_api_repository.dart';
import 'package:bluestack_assignment/core/service/internal_storage_service.dart';
import 'package:bluestack_assignment/modules/auth/model/user_model.dart';
import 'package:bluestack_assignment/modules/auth/view/login_screen.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../locator.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  InternalStorage internalStorage = InternalStorage();

  final AuthApiRepository _apiRepository = locator.get<AuthApiRepository>();

  final Map<String, String> _loginDetails = {
    "9898989898": "password123",
    "9876543210": "password123",
  };

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login({
    required String userId,
    required String password,
    VoidCallback? onSuccess,
    ValueChanged<String>? onError,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      if (!_loginDetails.containsKey(userId)) {
        throw Exception("Invalid credentials");
      }
      if (_loginDetails.containsKey(userId) &&
          _loginDetails[userId] != password) {
        throw Exception("Invalid credentials");
      }

      await internalStorage.setLoginCredentials(userId, password);

      Response response = await _apiRepository.login();

      _userModel =
          UserModel.fromJson(response.data["data"] as Map<String, dynamic>);

      onSuccess?.call();
    } on DioError catch (e) {
      debugPrint(e.message);

      onError?.call(e.message);
    } catch (e) {
      debugPrint(e.toString());
      onError?.call(e.toString());
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    await internalStorage.deleteLoginCredentials();
    await Navigator.of(context).pushNamedAndRemoveUntil(
      LoginScreen.routeName,
      (route) => false,
    );
  }
}
