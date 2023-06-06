import 'package:brainteaser/Screen/question.dart';
import 'package:flutter/material.dart';

import 'options.dart';

class Questioncard extends StatelessWidget {
  const Questioncard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: Column(
        children: [
          Text(
            sample_data[0]['question'],
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.black),
          ),
          const Options(),
          const Options(),
          const Options(),
          const Options()
        ],
      ),
    );
  }
}
