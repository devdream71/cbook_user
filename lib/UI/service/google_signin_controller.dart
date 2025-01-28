import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var userEmail = ''.obs;

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        userEmail.value = googleUser.email; // Update email in the controller
      }
    } catch (error) {
      Get.snackbar("Error", "Failed to sign in: $error");
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    userEmail.value = ''; // Clear the email when signed out
  }
}
