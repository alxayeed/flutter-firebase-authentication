import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/screens/register_screen.dart';
import 'package:firebase_authentication/screens/widgets/custom_button.dart';
import 'package:firebase_authentication/screens/widgets/custom_input_field.dart';
import 'package:firebase_authentication/screens/reset_password_screen.dart';
import 'package:firebase_authentication/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  final Function onClickRegister;

  const LoginScreen({Key? key, required this.onClickRegister})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();

  clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100.0),
                CustomInputField(controller: emailController, label: "Email"),
                CustomInputField(
                  controller: passwordController,
                  label: "Password",
                  isPassword: true,
                ),
                CustomButton(
                  label: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authService.signIn(emailController.text.trim(),
                          passwordController.text.trim(), context);
                      FocusScope.of(context).unfocus();
                    }
                  },
                  icon: const Icon(Icons.lock),
                ),
                const SizedBox(height: 10.0),
                GestureDetector(
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen(),
                        ));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No Account?'),
                    TextButton(
                        onPressed: () {
                          widget.onClickRegister();
                          clearControllers();
                        },
                        child: const Text('Register here'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
