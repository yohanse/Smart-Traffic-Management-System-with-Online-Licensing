import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  SharedPreferences get prefs;

  void cacheToken({required String accessToken, required String refreshToken});
  void deleteToken();
  String? getToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  final SharedPreferences prefs;

  AuthLocalDataSourceImpl({required this.prefs});

  @override
  cacheToken({required String accessToken, required String refreshToken}) async {
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('refreshToken', refreshToken);
  }

  @override
  deleteToken() async {
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
  }

  @override
  String? getToken() {
    return prefs.getString('accessToken');
  }
}
