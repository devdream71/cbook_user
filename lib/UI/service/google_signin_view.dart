import 'package:cbook_user/UI/service/google_signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 

class GoogleSignInView extends StatelessWidget {
  final GoogleSignInController _controller = Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Sign-In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                _controller.userEmail.isNotEmpty
                    ? "Signed in as: ${_controller.userEmail.value}"
                    : "Not Signed In",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _controller.signInWithGoogle,
              child: Text("Sign in with Google"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _controller.signOutFromGoogle,
              child: Text("Sign out"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
