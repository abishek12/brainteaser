import 'package:flutter/material.dart';

class AuthFooterText extends StatelessWidget {
  final String txtFirst;
  final String? txtSecond;
  final VoidCallback onTap;
  const AuthFooterText({
    super.key,
    required this.txtFirst,
    this.txtSecond,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            text: txtFirst,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
            children: [
              TextSpan(
                text: txtSecond,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
