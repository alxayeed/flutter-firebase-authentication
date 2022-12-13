import 'package:firebase_authentication/screens/home_screen.dart';
import 'package:firebase_authentication/screens/login_screen.dart';
import 'package:firebase_authentication/screens/widgets/custom_button.dart';
import 'package:firebase_authentication/screens/widgets/custom_input_field.dart';
import 'package:firebase_authentication/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

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
                  controller: password1Controller,
                  label: "Password",
                  isHidden: true,
                ),
                CustomInputField(
                    controller: password2Controller,
                    label: "Confirm Password",
                    isHidden: true),
                CustomButton(
                  onPressed: () {
                    authService.signUp(
                      emailController.text.trim(),
                      password1Controller.text.trim(),
                      context,
                    );
                    // clearControllers();
                  },
                  label: 'Register',
                  icon: const Icon(Icons.app_registration),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already registered?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
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
    );
  }
}
