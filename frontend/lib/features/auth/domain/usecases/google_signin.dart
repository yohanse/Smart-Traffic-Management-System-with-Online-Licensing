import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class GoogleSigninUsecase implements Usecase<bool, SignInGoogleParams> {
  final AuthRepository repository;

  GoogleSigninUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(SignInGoogleParams params) async {
    return await repository.signInWithGoogle();
  }
}

class SignInGoogleParams {}