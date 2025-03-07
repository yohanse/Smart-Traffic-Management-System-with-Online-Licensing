import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/features/auth/domain/usecases/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LogInUsecase logInUsecase;
  LoginBloc({required this.logInUsecase})
      : super(LoginInitial()) {
    on<LoginStarted>((event, emit) async {
      emit(LoginLoading());
      var result = await logInUsecase(
          LogInParams(email: event.email, password: event.password));
      result.fold((l) => emit(LoginFailure(message: l.message)),
          (r) => emit(LoginSuccess(success: r)));
    });
  }
}
