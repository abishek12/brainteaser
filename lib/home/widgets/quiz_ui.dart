import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/quiz_qn_provider.dart';
import 'quiz_list_tile.dart';

class QuizUi extends StatelessWidget {
  final dynamic data;
  final String quizId;
  const QuizUi({
    super.key,
    required this.data,
    required this.quizId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        List<String> answerOptions = [
          item['option1'],
          item['option2'],
          item['option3'],
          item['option4'],
        ];
        answerOptions.shuffle(Random());
        return Consumer<QuizQnProvider>(builder: (context, value, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Q${index + 1}) ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    children: [
                      TextSpan(
                        text: "${item['question']}",
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    value.selectAns = answerOptions[0];
                    value.checkCorrectOption('${item['option1']}');
                  },
                  child: QuizListTile(
                    label: 'A',
                    option: answerOptions[0],
                  ),
                ),
                InkWell(
                  onTap: () {
                    value.selectAns = answerOptions[1];
                    value.checkCorrectOption('${item['option1']}');
                  },
                  child: QuizListTile(
                    label: 'B',
                    option: answerOptions[1],
                  ),
                ),
                InkWell(
                  onTap: () {
                    value.selectAns = answerOptions[2];
                    value.checkCorrectOption('${item['option1']}');
                  },
                  child: QuizListTile(
                    label: 'C',
                    option: answerOptions[2],
                  ),
                ),
                InkWell(
                  onTap: () {
                    value.selectAns = answerOptions[3];
                    value.checkCorrectOption('${item['option1']}');
                  },
                  child: QuizListTile(
                    label: 'D',
                    option: answerOptions[3],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
