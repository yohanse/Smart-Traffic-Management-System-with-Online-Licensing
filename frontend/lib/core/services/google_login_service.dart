import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'openid',
  ]);

  Future<String?> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        return null;
      }
      final auth = await account.authentication;
      return auth.accessToken;
    } catch (e) {
      throw Exception("Google Sign-In failed: $e");
    }
  }
}
