import 'package:brainteaser/quiz/screen/quiz_question_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../home/services/quiz_services.dart';
import '../../home/widgets/home_float_btn_widget.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizServices services = QuizServices();
    return Scaffold(
      floatingActionButton: const HomeFloatBtnWidget(),
      body: StreamBuilder<QuerySnapshot>(
        stream: services.getQuizData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final items = snapshot.data!.docs[index];
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          flex: 2,
                          onPressed: (context) async {
                            await services.deleteQuiz(items['quizId']);
                          },
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: updateItem,
                          backgroundColor: const Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Save',
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizQuestionScreen(
                            quizId: items['quizId'],
                          ),
                        ),
                      ),
                      title: Text('${items['quizTitle']}'),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void updateItem(BuildContext context) {}
}
