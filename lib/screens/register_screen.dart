import 'package:firebase_authentication/screens/widgets/custom_button.dart';
import 'package:firebase_authentication/screens/widgets/custom_input_field.dart';
import 'package:firebase_authentication/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class RegisterScreen extends StatefulWidget {
  final Function onClickLogin;
  const RegisterScreen({
    Key? key,
    required this.onClickLogin,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  clearControllers() {
    emailController.clear();
    password1Controller.clear();
    password2Controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Register')),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50.0),
                  CustomInputField(controller: emailController, label: "Email"),
                  CustomInputField(
                    controller: password1Controller,
                    label: "Password",
                    isPassword: true,
                  ),
                  CustomInputField(
                      controller: password2Controller,
                      label: "Confirm Password",
                      isPassword: true),
                  CustomButton(
                    onPressed: () {
                      String pass1 = password1Controller.text.trim();
                      String pass2 = password2Controller.text.trim();

                      if (!validatePassword(pass1, pass2)) {
                        var snackBar = const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Password is\'nt matched'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      if (_formKey.currentState!.validate() &&
                          validatePassword(pass1, pass2)) {
                        authService.signUp(
                          emailController.text.trim(),
                          password1Controller.text.trim(),
                          context,
                        );
                      }

                      // clearControllers();
                    },
                    label: 'Register',
                    icon: const Icon(Icons.account_circle_rounded),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already registered?'),
                      TextButton(
                          onPressed: () {
                            widget.onClickLogin();
                            clearControllers();
                          },
                          child: const Text('Login here'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validatePassword(String pass1, String pass2) {
    if (pass1 != pass2) {
      return false;
    }
    return true;
  }
}
