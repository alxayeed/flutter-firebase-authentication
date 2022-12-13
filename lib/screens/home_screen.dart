import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/screens/widgets/custom_button.dart';
import 'package:firebase_authentication/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    final user = FirebaseAuth.instance.currentUser!;
    print(user);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(user.email!)),
            CustomButton(onPressed: (){
                authService.signOut();
            }, label: "Sign out", icon: const Icon(Icons.arrow_back),)
          ],
        ),
      ),
    );
  }
}
