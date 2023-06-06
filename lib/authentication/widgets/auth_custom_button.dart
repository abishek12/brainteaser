import 'package:flutter/material.dart';

class AuthCustomButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  const AuthCustomButton({
    super.key,
    required this.btnText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.green,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            btnText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
