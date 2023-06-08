import 'dart:math';

import 'package:flutter/material.dart';

import 'quiz_list_tile.dart';

class QuizUi extends StatelessWidget {
  final dynamic data;
  const QuizUi({
    super.key,
    required this.data,
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
              QuizListTile(
                label: 'A',
                option: answerOptions[0],
              ),
              QuizListTile(
                label: 'B',
                option: answerOptions[1],
              ),
              QuizListTile(
                label: 'C',
                option: answerOptions[2],
              ),
              QuizListTile(
                label: 'D',
                option: answerOptions[3],
              ),
            ],
          ),
        );
      },
    );
  }
}
