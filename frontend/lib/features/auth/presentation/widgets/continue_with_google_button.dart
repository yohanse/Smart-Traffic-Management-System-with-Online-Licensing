import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:frontend/features/auth/presentation/bloc/signin/signinwithgoogle_bloc.dart';
import 'package:go_router/go_router.dart';

class ContinueWithGoogleButton extends StatelessWidget {
  const ContinueWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninwithgoogleBloc, SigninwithgoogleState>(
      listener: (context, state) {
        if (state is SigninwithgoogleSuccess) {
          context.go("/test");
        }
        else if (state is SigninwithgoogleFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
        }
      },
      builder: (context, state) {
        return TextButton.icon(
          onPressed: state is SigninwithgoogleLoading? null:() {
            context.read<SigninwithgoogleBloc>().add(SignInWithGoogleStarted());
          },
          label: SizedBox(
            height: 20,
            child: state is SigninwithgoogleLoading? CircularProgressIndicator():Text(
            "   Continue with Google",
            style: Theme.of(context).textTheme.bodyMedium,
          ),),
          icon: FaIcon(
            FontAwesomeIcons.google, // Google icon from Font Awesome
            size: 24, // Color for the icon
          ),
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
              ),),
        );
      },
    );
  }
}
