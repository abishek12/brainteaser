import 'package:brainteaser/authentication/screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class AuthScreenStatus extends StatelessWidget {
  const AuthScreenStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MainScreen();
            } else {
              return const Loginscreen();
            }
          }),
    );
  }
}
