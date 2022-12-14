import 'package:firebase_authentication/screens/login_screen.dart';
import 'package:firebase_authentication/screens/register_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLogin ? LoginScreen(onClickRegister: toggle) : RegisterScreen(onClickLogin: toggle),
    );
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
