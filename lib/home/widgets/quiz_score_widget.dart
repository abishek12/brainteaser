import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizScoreWidget extends StatelessWidget {
  const QuizScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child) {
      return const AlertDialog(
        title: Text('Score'),
        content: Wrap(
          children: [
            ListTile(
              leading: Text('0'),
              title: Text('Correct'),
            ),
            ListTile(
              leading: Text('0'),
              title: Text('InCorrect'),
            ),
          ],
        ),
      );
    });
  }
}
