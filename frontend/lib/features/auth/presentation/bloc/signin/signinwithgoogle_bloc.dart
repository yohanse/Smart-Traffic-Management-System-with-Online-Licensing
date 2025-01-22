import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/google_signin.dart';

part 'signinwithgoogle_event.dart';
part 'signinwithgoogle_state.dart';

class SigninwithgoogleBloc extends Bloc<SigninwithgoogleEvent, SigninwithgoogleState> {
  final GoogleSigninUsecase googleSigninUsecase;
  SigninwithgoogleBloc({required this.googleSigninUsecase}) : super(SigninwithgoogleInitial()) {
    on<SignInWithGoogleStarted>((event, emit) async {
      emit(SigninwithgoogleLoading());
    
      var result = await googleSigninUsecase(SignInGoogleParams());
      result.fold((l) => emit(SigninwithgoogleFailure(message: l.message)),
          (r) => emit(SigninwithgoogleSuccess(success: r)));
    });
  }
}
