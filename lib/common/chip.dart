import 'package:flutter/material.dart';

class RoundedBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const RoundedBtn({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // customBorder: ShapeBorder(),
      onTap:onTap,
      child: Chip(
        label: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 3),
        backgroundColor: Colors.white,
      ),
    );
  }
}
