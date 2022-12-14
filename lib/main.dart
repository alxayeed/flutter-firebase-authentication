import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/screens/auth_screen.dart';
import 'package:firebase_authentication/screens/home_screen.dart';
import 'package:firebase_authentication/screens/login_screen.dart';
import 'package:firebase_authentication/screens/register_screen.dart';
import 'package:firebase_authentication/screens/verify_email_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Error occurred');
          } else if (snapshot.hasData) {
            return const VerifyEmailScreen();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
