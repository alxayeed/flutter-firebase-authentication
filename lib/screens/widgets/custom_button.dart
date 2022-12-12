import 'package:flutter/material.dart';

import '../home_screen.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50), // NEW
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
        // clearControllers();
      },
      child: Text(label),
    );
  }
}
