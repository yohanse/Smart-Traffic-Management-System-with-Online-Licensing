import 'package:equatable/equatable.dart';

class AuthEntitiy extends Equatable {
  final String email;
  String password, id;

  AuthEntitiy({required this.email, this.password="", this.id=""});

  @override
  List<Object?> get props => [
    id,
    email,
    password
  ];
}