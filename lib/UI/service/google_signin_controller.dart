// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';


 
// class GoogleSignInController extends GetxController {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   var userEmail = ''.obs;

//   Future<void> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
//       if (googleUser != null) {
//         userEmail.value = googleUser.email; // Update email in the controller
//       } else {
//         // Google Sign-In was cancelled by the user
//         _showSnackbar("Sign-In", "Google Sign-In was cancelled.");
//       }
//     } catch (error) {
//       _showSnackbar("Error", "Failed to sign in: $error");
//     }
//   }

//   Future<void> signOutFromGoogle() async {
//     await _googleSignIn.signOut();
//     userEmail.value = ''; // Clear the email when signed out
//     _showSnackbar("Signed Out", "You have been signed out successfully.");
//   }

//   void _showSnackbar(String title, String message) {
//     // Ensure Snackbar only shows if context is available
//     Future.delayed(Duration.zero, () {
//       if (Get.context != null) {
//         Get.snackbar(title, message);
//       }
//     });
//   }
// }



import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var userEmail = ''.obs;

  // Future<void> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
  //     if (googleUser != null) {
  //       userEmail.value = googleUser.email; // Update email in the controller
  //       print("Google Sign-In Success: ${googleUser.email}"); // ✅ Print email
  //     } else {
  //       _showSnackbar("Sign-In", "Google Sign-In was cancelled.");
  //     }
  //   } catch (error) {
  //     _showSnackbar("Error", "Failed to sign in: $error");
  //   }
  // }

  Future<void> signInWithGoogle() async {
  try {
    print("Google Sign-In started...");
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    
    if (googleUser != null) {
      userEmail.value = googleUser.email; // Update email in the controller
      print("✅ Google Sign-In Success: ${googleUser.email}"); // Confirm sign-in
    } else {
      print("⚠️ Google Sign-In was cancelled by the user.");
      _showSnackbar("Sign-In", "Google Sign-In was cancelled.");
    }
  } catch (error, stackTrace) {
    print("❌ Google Sign-In Failed: $error");
    print("StackTrace: $stackTrace"); // Log full error trace
    _showSnackbar("Error", "Failed to sign in: $error");
  }
}


  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    userEmail.value = ''; // Clear email
    _showSnackbar("Signed Out", "You have been signed out successfully.");
  }

  void _showSnackbar(String title, String message) {
    Future.delayed(Duration.zero, () {
      if (Get.context != null) {
        Get.snackbar(title, message);
      }
    });
  }
}
