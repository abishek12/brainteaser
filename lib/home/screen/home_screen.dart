import 'package:brainteaser/home/widgets/create_question_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const CreateQuestionWidget(
                  quizId: 'asasdsad',
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    child: reusableContainer(
                      title: "Computer Fundamentals",
                      icon: Icons.window,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  reusableContainer(title: "SpreadSheet", icon: Icons.rowing),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  reusableContainer(
                      title: "Word Processing", icon: Icons.wordpress),
                  const SizedBox(
                    width: 15,
                  ),
                  reusableContainer(title: "Database", icon: Icons.rowing),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  reusableContainer(title: "Web Design", icon: Icons.window),
                  const SizedBox(
                    width: 15,
                  ),
                  reusableContainer(
                      title: "Cyber Security", icon: Icons.rowing),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  reusableContainer(title: "Networking", icon: Icons.window),
                  const SizedBox(
                    width: 15,
                  ),
                  reusableContainer(
                      title: "Practice Question", icon: Icons.rowing),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  reusableContainer(
                      title: "Operating Stystem", icon: Icons.window),
                  const SizedBox(
                    width: 15,
                  ),
                  reusableContainer(
                      title: "General Knowledge", icon: Icons.rowing),
                ],
              ),
            ],
          ),
        ));
  }

  Container reusableContainer({required String title, required IconData icon}) {
    return Container(
      color: Colors.white,
      width: 180,
      height: 100,
      child: Center(
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(icon),
        ),
      ),
    );
  }
}
