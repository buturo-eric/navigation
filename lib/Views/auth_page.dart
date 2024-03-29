import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:navigation/Views/login_page.dart";

import "../main.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              // User Successfully logged in
              if (snapshot.hasData) {
                return Widget197();
              }
              //User not logged in
              else {
                return LoginPage();
              }
            }));
  }
}
