
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled the sign-in
        return null;
      }
      return googleUser;
    } catch (error) {
      debugPrint('Error during Google Sign-In: $error');
      return null;
    }
  }

  static Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
    debugPrint("User Signed Out");
  }
}
