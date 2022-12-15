import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/screens/home_screen.dart';
import 'package:firebase_authentication/screens/widgets/custom_button.dart';
import 'package:firebase_authentication/services/auth_service.dart';
import 'package:firebase_authentication/utils/utils.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  AuthService authService = AuthService();
  Timer? timer;

  @override
  initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (timer) {
          checkEmailVerified();
        },
      );
    }
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? const HomeScreen()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Verify Email'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    'A link is sent to your email for verification. Please check your inbox',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                CustomButton(
                  onPressed: canResendEmail ? sendVerificationEmail : null,
                  label: "Resend email",
                  icon: const Icon(Icons.email),
                ),
                const SizedBox(height: 10.0),
                CustomButton(
                  onPressed: () {
                    authService.signOut();
                  },
                  label: 'Cancel',
                  color: Colors.red.shade800,
                  icon: const Icon(Icons.cancel),
                )
              ],
            ),
          );
  }

  void checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer!.cancel();
    }
  }

  Future sendVerificationEmail() async {
    try {
      authService.verifyEmail();
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }

    setState(() {
      canResendEmail = false;
    });
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      canResendEmail = true;
    });
  }
}
