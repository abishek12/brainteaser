import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/quiz_qn_provider.dart';

class QuizListTile extends StatelessWidget {
  final String option;
  final String label;
  const QuizListTile({
    super.key,
    required this.option,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, left: 12.0),
      child: Consumer<QuizQnProvider>(builder: (context, value, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: value.isCorrectAns ? Colors.green : Colors.transparent,
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle,
              ),
              child: Text(label),
            ),
            const SizedBox(width: 12),
            Text(
              option,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        );
      }),
    );
  }
}
