import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> checkLoading() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      _isLoading = false;
      notifyListeners();
    });
  }
}
