import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:frontend/features/auth/data/datasources/local.dart';

import '../../../../core/error/exception.dart';

abstract class AuthRemoteDataSource {
  AuthLocalDataSource get authLocalDataSource;

  Future<bool> logIn(String email, String password);
  Future<bool> verifyGoogleToken(String idToken);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  final AuthLocalDataSource authLocalDataSource;

  AuthRemoteDataSourceImpl({required this.authLocalDataSource});

  @override
  Future<bool> logIn(String email, String password) async {
    String url = "http://192.168.188.105:8000/auth/jwt/create/";
    final responseData = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}));

    print(responseData.body);
    if (responseData.statusCode == 200 || responseData.statusCode == 201) {
      try {
        authLocalDataSource.cacheToken(
          accessToken: jsonDecode(responseData.body)["access"],
          refreshToken: jsonDecode(responseData.body)["refresh"],
        );
        return true;
      } catch (e) {
        throw CacheException();
      }
    }
    if (responseData.statusCode == 401) {
      throw UsernameAndPasswordDoesNotMatchException();
    }
    throw ServerException();
  }

  @override
  Future<bool> verifyGoogleToken(String idToken) async {
    String url = "http://192.168.188.105:8000/core/google-login/";
    final responseData = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': idToken}));

    print(responseData.body);
    if (responseData.statusCode == 201) {
      authLocalDataSource.cacheToken(
        accessToken: jsonDecode(responseData.body)["access"],
        refreshToken: jsonDecode(responseData.body)["refresh"],
      );
      return true;
    } else {
      throw Exception('Token verification failed');
    }
  }
}
