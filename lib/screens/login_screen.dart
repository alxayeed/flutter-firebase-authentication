import 'package:firebase_authentication/screens/register_screen.dart';
import 'package:firebase_authentication/screens/widgets/custom_button.dart';
import 'package:firebase_authentication/screens/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  clearControllers() {
    emailController.clear();
    passwordController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),
                CustomInputField(controller: emailController, label: "Email"),
                CustomInputField(
                  controller: passwordController,
                  label: "Password",
                  isHidden: true,
                ),
                CustomButton(
                  label: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                    clearControllers();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No Account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()),
                          );
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
