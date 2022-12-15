import 'package:flutter/material.dart';

import '../home_screen.dart';

class CustomButton extends StatelessWidget {
  final dynamic onPressed;
  final String label;
  final Icon icon;
  final Color color;

  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.icon,
      this.color = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: color,
          minimumSize: const Size.fromHeight(50), // NEW
        ),
        onPressed: onPressed,
        label: Text(label),
        icon: icon,
      ),
    );
  }
}
