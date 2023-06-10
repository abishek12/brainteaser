import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/quiz_services.dart';
import '../widgets/home_ui_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    QuizServices quizServices = QuizServices();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: quizServices.getQuizData(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return HomeUiWidget(
            snapshot: snapshot,
          );
        },
      ),
    );
  }
}
