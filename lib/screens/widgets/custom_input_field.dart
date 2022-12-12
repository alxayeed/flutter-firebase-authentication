import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isHidden;

  const CustomInputField({
    Key? key,
    required this.controller,
    required this.label,
    this.isHidden=false,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: TextFormField(
        controller: controller,
        obscureText: isHidden,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red, //this has no effect
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: (value) {
          if (isHidden && value!.isEmpty) {
            return "$label must be provided";
          }
          return null;
        },
      ),
    );
  }
}
