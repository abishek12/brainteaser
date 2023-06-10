import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuizServices {
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('Quiz');

  Future<void> addQuizData(Map quizData, String quizId) async {
    await _reference.doc(quizId).set(quizData).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> addQuestionData(
    Map<String, String> questionData,
    String quizId,
  ) async {
    await _reference.doc(quizId).collection('QNA').add(questionData);
  }

  getQuizData() {
    return FirebaseFirestore.instance.collection('Quiz').snapshots();
  }

  getQuestionData(String quizId) {
    return _reference.doc(quizId).collection('QNA').snapshots();
  }

  deleteQuiz(String quizId) {
    return _reference.doc(quizId).delete();
  }
}
