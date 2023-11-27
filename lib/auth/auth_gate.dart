import 'package:flutter/material.dart';
import 'package:soundgrade/widgets/title.dart';
import 'package:soundgrade/screens/feed.dart';

// Firebase config
import 'package:soundgrade/firebase_options.dart';

// Auth packages
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              providers: [
                EmailAuthProvider(),
                GoogleProvider(clientId: webClientId)
              ],
              headerBuilder: (context, constraints, shrinkOffset) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: SoundGradeTitle(),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: action == AuthAction.signIn
                        ? const Text("Please Sign In!")
                        : const Text("Please Sign Up!"));
              },
              footerBuilder: (context, action) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "By signing in, you agree to our terms and conditions.",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
            );
          }
          return const MainPage();
        });
  }
}
