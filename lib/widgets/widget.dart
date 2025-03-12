import 'package:flutter/material.dart';

Container customText(
    {required String hintText, required TextEditingController controller}) {
  return Container(
    width: 300,
    height: 52,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 249, 249, 249),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(0, 255, 252, 252),
        hintText: hintText,
        border: InputBorder.none,
      ),
    ),
  );
}
