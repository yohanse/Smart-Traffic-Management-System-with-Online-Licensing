import 'package:frontend/features/auth/domain/entities/auth_entitiy.dart';

class AuthModel extends AuthEntitiy {
  AuthModel(
      {required super.email,
      super.password,
      super.id,
    });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      id: json['id'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "email": email,
      "password": password,
    };
  }
}