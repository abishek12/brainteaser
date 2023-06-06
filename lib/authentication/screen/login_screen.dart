import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/my_string.dart';
import '../helper/login_helper.dart';
import '../widgets/auth_custom_button.dart';
import '../widgets/auth_footer_text.dart';
import '../widgets/auth_header.dart';
import '../widgets/custom_text_field.dart';
import 'register_screen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Consumer<LoginProvider>(builder: (context, value, child) {
          return Column(
            children: [
              const AuthHeaderWidget(),
              Container(
                height: MediaQuery.of(context).size.width * 0.95,
                width: MediaQuery.of(context).size.width * 0.9,
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    child: Column(
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hintText: 'Enter your email',
                          label: MyString.email,
                          controller: email,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hintText: 'Enter your password',
                          label: MyString.password,
                          controller: password,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Password'),
                          ),
                        ),
                        AuthCustomButton(
                          btnText: value.isLoading ? 'Loading' : 'Login',
                          onTap: () {
                            value.checkLogin(email.text, password.text);
                          },
                        ),
                        AuthFooterText(
                          txtFirst: 'Create an account? ',
                          txtSecond: 'Register',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
