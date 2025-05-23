import 'package:frontend/core/services/google_login_service.dart';
import 'package:frontend/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:frontend/features/auth/domain/repositories/auth_repository.dart';
import 'package:frontend/features/auth/domain/usecases/google_signin.dart';
import 'package:frontend/features/auth/domain/usecases/login.dart';
import 'package:frontend/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:frontend/features/auth/presentation/bloc/signin/signinwithgoogle_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/auth/data/datasources/local.dart';
import 'features/auth/data/datasources/remote.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(
    () => LoginBloc(
      logInUsecase: sl(),
    ),
  );

  sl.registerFactory(
    () => SigninwithgoogleBloc(googleSigninUsecase: sl(),),
  );

  //use case
  sl.registerLazySingleton(() => LogInUsecase(sl()));
  sl.registerLazySingleton(() => GoogleSigninUsecase(sl()));

  //Remote Data Source
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      authLocalDataSource: sl(),
    ),
  );

  // Local Data Source
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      prefs: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkInfo: sl(),
      authRemoteDataSource: sl(),
      googleSignInService: sl(),
    ),
  );

  //Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: sl(),
    ),
  );

  //External
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
  sl.registerLazySingleton(() => SharedPreferences.getInstance());
  sl.registerLazySingleton(() => GoogleSignInService());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
