import 'package:firebase_authentication/main.dart';
import 'package:flutter/material.dart';

class Utils {
  static showSnackBar(String message, {Color color = Colors.red}) {
    if (message.isEmpty) return;

    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message),
    );

    scaffoldMessengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
