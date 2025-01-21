import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class LogInUsecase implements Usecase<bool, LogInParams> {
  final AuthRepository repository;

  LogInUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(LogInParams params) async {
    return await repository.logIn(params.email, params.password);
  }
}

class LogInParams {
  final String email;
  final String password;

  const LogInParams({required this.email, required this.password});
}