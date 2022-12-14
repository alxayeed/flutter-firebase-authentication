import 'package:firebase_authentication/main.dart';
import 'package:flutter/material.dart';

class Utils {
  static showSnackBar(String message) {
    if (message.isEmpty) return;

    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
    );

    scaffoldMessengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
  }
}
