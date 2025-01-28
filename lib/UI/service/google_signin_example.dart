import 'package:cbook_user/UI/service/google_signin_service.dart';
import 'package:flutter/material.dart';

class GoogleSignInExample extends StatelessWidget {
  const GoogleSignInExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign-In Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final user = await GoogleSignInService.signInWithGoogle();
            if (user != null) {
              debugPrint('User Signed In: ${user.displayName}, ${user.email}');
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Welcome, ${user.displayName}!'),
              ));
            } else {
              debugPrint('Sign-In Failed or Canceled.');
            }
          },
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}
