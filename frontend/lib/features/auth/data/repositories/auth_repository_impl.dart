import 'package:dartz/dartz.dart';

import 'package:frontend/core/error/failures.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/services/google_login_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;
  final GoogleSignInService googleSignInService;

  AuthRepositoryImpl(
      {required this.authRemoteDataSource,
      required this.networkInfo,
      required this.googleSignInService});

  @override
  Future<Either<Failure, bool>> logIn(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final ans = await authRemoteDataSource.logIn(email, password);
        return Right(ans);
      } on ServerException {
        return const Left(ServerFailure("Server not working properly."));
      } on EmailNotCorrectException {
        return const Left(EmailNotCorrectFailure("Email not correct"));
      } catch (e) {

        return const Left(ServerFailure("Server not working properly."));
      }
    } else {
      return const Left(NetworkFailure("Netwrok error."));
    }
  }

  @override
  Future<Either<Failure, bool>> signInWithGoogle() async {
    final idToken = await googleSignInService.signInWithGoogle();
    if (idToken != null) {
      try {
        await authRemoteDataSource.verifyGoogleToken(idToken);
        return Right(true);
      } catch (e) {
        return Left(ServerFailure("Server not working properly."));
      }
    }
    return Left(ServerFailure("Server not working properly."));
  }
}
