import 'package:brainteaser/authentication/helper/user_store_helper.dart';
import 'package:brainteaser/authentication/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  bool _isSuccess = false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;

  Future<void> checkRegister(
    email,
    pass, {
    String? fName,
    String? lName,
  }) async {
    _isLoading = true;
    notifyListeners();

    // call login function
    await authRegister(email, pass).then(
      (value) => UserHelper()
          .addUserCloudStore(
        UserModel(
          firstName: fName!,
          lastName: lName!,
          email: email,
        ),
        FirebaseAuth.instance.currentUser!.uid,
      )
          .then((value) {
        _isSuccess = true;
        notifyListeners();
      }),
    );
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
