import 'package:brainteaser/home/widgets/quiz_score_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../main/widgets/custom_app_bar.dart';
import '../services/quiz_services.dart';
import '../widgets/quiz_ui.dart';

class HomeQnScreen extends StatelessWidget {
  final String quizId;
  final String quizTitle;
  const HomeQnScreen({
    super.key,
    required this.quizId,
    required this.quizTitle,
  });

  @override
  Widget build(BuildContext context) {
    final QuizServices quizServices = QuizServices();
    return Scaffold(
      appBar: customAppBar(title: quizTitle),
      body: StreamBuilder<QuerySnapshot>(
          stream: quizServices.getQuestionData(quizId),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            if (snapshot.hasData) {
              final data = snapshot.data!.docs;
              return QuizUi(data: data);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const QuizScoreWidget(),
            ),
            child: const Icon(Icons.sports_score),
          ),
          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.check),
          ),
        ],
      ),
    );
  }
}
