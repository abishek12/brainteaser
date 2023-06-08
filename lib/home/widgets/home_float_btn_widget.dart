import 'package:flutter/material.dart';

import 'create_quiz_widget.dart';

class HomeFloatBtnWidget extends StatelessWidget {
  const HomeFloatBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return const CreateQuizWidget();
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
