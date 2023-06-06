import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> checkLogin(email, pass) async {
    _isLoading = true;
    notifyListeners();

    // call login function
    await authLogin(email, pass);
    _isLoading = false;
    notifyListeners();
  }
}

Future<String> authLogin(
  String emailAddress,
  String password,
) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return '';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      return 'Wrong password provided for that user.';
    }
    return 'An error occurred. Please try again.';
  }
}
