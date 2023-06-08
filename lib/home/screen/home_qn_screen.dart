import 'package:brainteaser/main/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/quiz_list_tile.dart';

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
    return Scaffold(
      appBar: customAppBar(title: quizTitle),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Q${index + 1}) ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    children: const [
                      TextSpan(
                        text:
                            "Which animal is known as the 'Ship of the Desert'?",
                      ),
                    ],
                  ),
                ),
                const QuizListTile(
                  label: 'A',
                  option: 'Camel',
                ),
                const QuizListTile(
                  label: 'B',
                  option: 'Dog',
                ),
                const QuizListTile(
                  label: 'C',
                  option: 'Elephant',
                ),
                const QuizListTile(
                  label: 'A',
                  option: 'Tadpole',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
