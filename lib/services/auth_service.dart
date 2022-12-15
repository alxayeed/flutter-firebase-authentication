import 'package:firebase_authentication/main.dart';
import 'package:firebase_authentication/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../screens/home_screen.dart';

class AuthService {
  Future signUp(String email, String password, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message!);
      debugPrint(e.toString());
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future signIn(String email, String password, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message!);
      debugPrint(e.toString());
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  Future resetPassword(String email, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Utils.showSnackBar(
          "Password reset email sent, Please check your email and comeback soon!",
          color: Colors.greenAccent);
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message.toString());
      Navigator.pop(context);
    }
  }
}
