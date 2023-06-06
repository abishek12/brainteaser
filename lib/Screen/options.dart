import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black)),
      child: const Row(
        children: [
          Text(
            "1.Test",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
