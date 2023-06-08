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

  providerCreateQNA(question, o1, o2, o3, o4) async {
    _isLoading = true;
    notifyListeners();

    Map<String, String> quizData = {
      'question': question,
      'option1': o1,
      'option2': o2,
      'option3': o3,
      'option4': o4,
    };

    await _quizServices.addQuestionData(quizData, quizId);

    _isLoading = false;
    notifyListeners();
  }
}
