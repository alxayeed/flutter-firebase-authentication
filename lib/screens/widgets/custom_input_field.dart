import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;

  const CustomInputField({
    Key? key,
    required this.controller,
    required this.label,
    this.isPassword=false,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0, left: 18.0, right: 18.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        textInputAction: TextInputAction.done,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
          if (value!.isEmpty) {
            return "$label must be provided";
          }
          if(!isPassword && !EmailValidator.validate(value)){
            return 'Please enter a valid email';
          }
          if(isPassword && value.length<8){
            return 'Should be at least 8 characters';
          }
          return null;
        },
      ),
    );
  }
}
