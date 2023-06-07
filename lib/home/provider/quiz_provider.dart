import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../services/quiz_services.dart';

class QuizProvider extends ChangeNotifier {
  final _quizServices = QuizServices();
  final String _quizId = randomString(16);
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String get quizId => _quizId;

  set isLoading(value) {
    _isLoading = value;
  }

  providerCreateQuiz(title, image, desc) async {
    _isLoading = true;
    notifyListeners();

    Map<String, String> quizData = {
      'quizId': _quizId,
      'quizTitle': title,
      'quizImage': image,
      'quizDesc': desc,
    };
    await _quizServices.addQuizData(quizData, _quizId);
    _isLoading = false;
    notifyListeners();
  }
}
