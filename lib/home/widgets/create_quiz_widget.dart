import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../authentication/widgets/auth_custom_button.dart';
import '../../authentication/widgets/custom_text_field.dart';
import '../provider/quiz_provider.dart';
import 'create_question_widget.dart';

class CreateQuizWidget extends StatelessWidget {
  const CreateQuizWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();

    final TextEditingController title = TextEditingController();
    final TextEditingController image = TextEditingController();
    final TextEditingController description = TextEditingController();

    return Consumer<QuizProvider>(builder: (context, value, child) {
      return AlertDialog(
        title: const Text('Create Quiz'),
        content: value.isLoading
            ? const Wrap(
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              )
            : Form(
                key: key,
                child: Wrap(
                  children: [
                    CustomTextField(
                      hintText: 'Enter Title',
                      label: 'Title',
                      controller: title,
                      onValidate: (value) {
                        if (value!.isEmpty) {
                          return 'Title is required';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      hintText: 'Enter Image Url',
                      label: 'Image',
                      controller: image,
                      onValidate: (value) {
                        if (value!.isEmpty) {
                          return 'Image is required';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      hintText: 'Enter Description',
                      label: 'Description',
                      controller: description,
                      onValidate: (value) {
                        if (value!.isEmpty) {
                          return 'Description is required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
        actions: [
          AuthCustomButton(
            btnText: 'Create Quiz',
            onTap: () {
              final formField = key.currentState;
              if (formField!.validate()) {
                value.providerCreateQuiz(
                  title.text,
                  image.text,
                  description.text,
                );
                Fluttertoast.showToast(
                  msg: "Quiz has been created",
                );
                Navigator.pop(context);
              } else {
                value.isLoading = false;
              }
            },
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      );
    });
  }
}
