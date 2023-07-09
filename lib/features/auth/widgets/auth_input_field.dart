import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final bool hideText;
  final TextEditingController controller;
  final String hint;
  const AuthInputField(
      {super.key,
      required this.controller,
      required this.hint,
      this.hideText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 21),
      // autofillHints: ,
      obscureText: hideText,
      obscuringCharacter: '*',
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.amber, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          )),
    );
  }
}
