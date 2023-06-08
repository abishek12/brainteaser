import 'package:brainteaser/home/screen/home_qn_screen.dart';
import 'package:flutter/material.dart';

class HomeUiWidget extends StatelessWidget {
  final dynamic snapshot;
  const HomeUiWidget({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) {
        final data = snapshot.data!.docs[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeQnScreen(
                quizId: '${data['quizId']}',
                quizTitle: '${data['quizTitle']}',
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    '${data['quizImage']}',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.black26,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${data['quizTitle']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
