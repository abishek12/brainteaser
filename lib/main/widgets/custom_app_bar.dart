import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({
  String? title,
}) {
  return AppBar(
    title: Text(title ?? 'Quiz'),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () => FirebaseAuth.instance.signOut(),
        icon: const Icon(Icons.logout),
      ),
    ],
  );
}
