import 'package:firebase_authentication/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../screens/home_screen.dart';

class AuthService {
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

    } on FirebaseAuthException catch (_, e) {

      const snackBar = SnackBar(
        content: Text('Email or Password incorrect!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}