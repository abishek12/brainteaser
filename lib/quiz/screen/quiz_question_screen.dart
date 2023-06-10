import 'package:brainteaser/home/services/quiz_services.dart';
import 'package:brainteaser/main/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../home/widgets/create_question_widget.dart';

class QuizQuestionScreen extends StatelessWidget {
  final String quizId;
  const QuizQuestionScreen({
    super.key,
    required this.quizId,
  });

  @override
  Widget build(BuildContext context) {
    final QuizServices services = QuizServices();
    return Scaffold(
      appBar: customAppBar(title: 'Question'),
      body: StreamBuilder<QuerySnapshot>(
        stream: services.getQuestionData(quizId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data = snapshot.data!.docs[index];
                return snapshot.data!.docs.isEmpty
                    ? const Center(
                        child: Text('Nothing to Display'),
                      )
                    : ListTile(
                        leading: Text('Q${index + 1}'),
                        title: Text(data['question']),
                      );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return CreateQuestionWidget(quizId: quizId);
            }),
        child: const Icon(Icons.question_answer_outlined),
      ),
    );
  }
}
