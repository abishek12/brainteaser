import 'package:brainteaser/main/screen/auth_screen_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../helper/register_helper.dart';
import '../widgets/auth_custom_button.dart';
import '../widgets/auth_footer_text.dart';
import '../widgets/custom_text_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final key = GlobalKey<FormState>();

  final firstName = TextEditingController();
  final secondName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repeatPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Consumer<RegisterProvider>(builder: (context, value, child) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.pink[600],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60))),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Quiz app',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        const Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hintText: 'Enter your Firstname',
                          label: 'Firstname',
                          controller: firstName,
                          onValidate: (value) {
                            if (value!.isEmpty) {
                              return 'First name is required';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          hintText: 'Enter your Lastname',
                          label: 'Lastname',
                          controller: secondName,
                          onValidate: (value) {
                            if (value!.isEmpty) {
                              return 'Last name is required';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          hintText: 'Enter your email',
                          label: 'Email',
                          controller: email,
                          onValidate: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          isObscureText: true,
                          hintText: 'Enter your Password',
                          label: 'Password',
                          controller: password,
                          onValidate: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length <= 8 && value.length > 15) {
                              return 'Character should be between 8 and 15';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          isObscureText: true,
                          hintText: 'Enter your password again',
                          label: 'Confirm',
                          controller: repeatPassword,
                          onValidate: (value) {
                            if (value != password.text) {
                              return "Password didn't matched";
                            }
                            return null;
                          },
                        ),
                        value.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : AuthCustomButton(
                                btnText: 'Register',
                                onTap: () {
                                  final formField = key.currentState;
                                  if (formField!.validate()) {
                                    value
                                        .checkRegister(
                                      email.text,
                                      password.text,
                                      fName: firstName.text,
                                      lName: secondName.text,
                                    )
                                        .then((val) {
                                      value.isSuccess
                                          ? Fluttertoast.showToast(
                                              msg: 'Registration Successfull')
                                          : Container();
                                    }).then((value) => {
                                              FirebaseAuth.instance.signOut(),
                                            });
                                  }
                                },
                              ),
                        AuthFooterText(
                          txtFirst: 'Back to login',
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Loginscreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
