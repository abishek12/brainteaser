import 'package:brainteaser/main/screen/auth_screen_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(builder: (context, value, child) {
      return Scaffold(
        body: value.isLoading
            ? const Center(
                child: Text('Quiz App'),
              )
            : const AuthScreenStatus(),
      );
    });
  }
}
