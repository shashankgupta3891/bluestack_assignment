import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

class InternalStorage {
  static const String userIdKey = 'userId';
  static const String passwordKey = 'password';

  static SharedPreferences? _sharedPrefs;

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  Future<bool>? deleteUserId() {
    _sharedPrefs?.remove(userIdKey);
  }

  Future<bool>? deletePasswordId() {
    _sharedPrefs?.remove(passwordKey);
  }

  String? get getUserId => _sharedPrefs?.getString(userIdKey);
  Future<bool>? setUserId(String value) =>
      _sharedPrefs?.setString(userIdKey, value);

  String? get getPassword => _sharedPrefs?.getString(passwordKey);
  Future<bool>? setPassword(String value) =>
      _sharedPrefs?.setString(passwordKey, value);

  Future<bool>? setLoginCredentials(String userId, String password) async {
    try {
      await _sharedPrefs?.setString(userIdKey, userId);
      await _sharedPrefs?.setString(passwordKey, password);
    } catch (e) {
      return false;
    }

    return true;
  }

  Tuple2<String?, String?> getLoginCredentials() {
    final String? userId = _sharedPrefs?.getString(userIdKey);
    final String? password = _sharedPrefs?.getString(passwordKey);

    return Tuple2(userId, password);
  }

  Future<bool>? deleteLoginCredentials() async {
    try {
      await _sharedPrefs?.remove(userIdKey);
      await _sharedPrefs?.remove(passwordKey);
    } catch (e) {
      return false;
    }

    return true;
  }

  bool hasLoginCredentials() {
    final bool hasUserId = _sharedPrefs?.containsKey(userIdKey) ?? false;
    final bool hasPassword = _sharedPrefs?.containsKey(passwordKey) ?? false;

    return hasUserId && hasPassword;
  }
}
