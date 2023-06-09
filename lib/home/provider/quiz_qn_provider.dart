import 'package:flutter/foundation.dart';

class QuizQnProvider extends ChangeNotifier {
  int _correctAns = 0;
  int _inCorrectAns = 0;
  String _selectAns = "";
  bool _isCorrectAns = false;

  bool get isCorrectAns => _isCorrectAns;
  String get selectAns => _selectAns;

  // ticker for numbers
  int get correctAns => _correctAns;
  int get inCorrectAns => _inCorrectAns;

  set selectAns(String value) {
    _selectAns = value;
    notifyListeners();
  }

  checkCorrectOption(String value) {
    if (_selectAns == value) {
      _correctAns = _correctAns + 1;
      _isCorrectAns = true;
      notifyListeners();
    } else {
      _inCorrectAns = _inCorrectAns + 1;
      _isCorrectAns = false;
      notifyListeners();
    }

    notifyListeners();
  }
}
