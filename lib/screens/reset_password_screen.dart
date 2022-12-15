import 'package:firebase_authentication/screens/widgets/custom_button.dart';
import 'package:firebase_authentication/screens/widgets/custom_input_field.dart';
import 'package:firebase_authentication/services/auth_service.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset password'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomInputField(
              controller: emailController,
              label: "Email",
            ),
            CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    authService.resetPassword(
                      emailController.text.trim(),
                      context,
                    );
                  }
                },
                label: 'Reset Password',
                icon: const Icon(Icons.email))
          ],
        ),
      ),
    );
  }
}
