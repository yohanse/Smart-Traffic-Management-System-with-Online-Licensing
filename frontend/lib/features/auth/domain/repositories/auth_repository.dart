import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> logIn(String email, String password);
  Future<Either<Failure, bool>>signInWithGoogle();
}
