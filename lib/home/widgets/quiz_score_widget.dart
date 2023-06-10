import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/quiz_qn_provider.dart';

class QuizScoreWidget extends StatelessWidget {
  const QuizScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizQnProvider>(builder: (context, value, child) {
      return AlertDialog(
        title: const Text('Score'),
        content: Wrap(
          children: [
            ListTile(
              leading: Text('${value.correctAns}'),
              title: const Text('Correct'),
            ),
            ListTile(
              leading: Text('${value.inCorrectAns}'),
              title: const Text('InCorrect'),
            ),
          ],
        ),
      );
    });
  }
}
