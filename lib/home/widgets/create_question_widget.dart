import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../authentication/widgets/custom_text_field.dart';
import '../provider/quiz_provider.dart';

class CreateQuestionWidget extends StatelessWidget {
  final String quizId;
  const CreateQuestionWidget({
    super.key,
    required this.quizId,
  });

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();

    final question = TextEditingController();

    final option1 = TextEditingController();
    final option2 = TextEditingController();
    final option3 = TextEditingController();
    final option4 = TextEditingController();

    return Consumer<QuizProvider>(builder: (context, value, _) {
      return AlertDialog(
        title: const Text('Add Question'),
        content: Form(
          key: key,
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                CustomTextField(
                  hintText: 'Question ?',
                  label: 'Question',
                  controller: question,
                  onValidate: (value) {
                    if (value!.isEmpty) {
                      return 'Question is required';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'Option 1',
                  label: 'One',
                  controller: option1,
                  onValidate: (value) {
                    if (value!.isEmpty) {
                      return 'Option 1 is required';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'Option 2',
                  label: 'Two',
                  controller: option2,
                  onValidate: (value) {
                    if (value!.isEmpty) {
                      return 'Option 2 is required';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'Option 3',
                  label: 'Three',
                  controller: option3,
                  onValidate: (value) {
                    if (value!.isEmpty) {
                      return 'Option 3 is required';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'Option 4',
                  label: 'Four',
                  controller: option4,
                  onValidate: (value) {
                    if (value!.isEmpty) {
                      return 'Option 4 is required';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.check),
            label: const Text('Submit'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              final formField = key.currentState;
              if (formField!.validate()) {
                value.providerCreateQNA(
                  question.text,
                  option1.text,
                  option2.text,
                  option3.text,
                  option4.text,
                );
              }
            },
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Next'),
          ),
        ],
      );
    });
  }
}
