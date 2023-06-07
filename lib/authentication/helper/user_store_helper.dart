import 'package:brainteaser/authentication/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserHelper {
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUserCloudStore(UserModel userModel, String userId) async {
    return await _reference
        .doc(userId)
        .set(userModel.toJson())
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }
}
