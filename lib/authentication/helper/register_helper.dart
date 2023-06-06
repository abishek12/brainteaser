import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> checkRegister(email, pass) async {
    _isLoading = true;
    notifyListeners();

    // call login function
    await authRegister(email, pass);
    _isLoading = false;
    notifyListeners();
  }
}

Future<void> authRegister(email, password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}
