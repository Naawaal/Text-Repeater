import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextformfiledWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const TextformfiledWidget(
      {super.key, required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType:
          labelText == 'Enter Text' ? TextInputType.text : TextInputType.number,
      textInputAction: labelText == 'Enter Text'
          ? TextInputAction.next
          : TextInputAction.done,
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.green,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.green,
          ),
        ),
      ),
    ).marginOnly(left: 10, right: 10, top: 05, bottom: 05);
  }
}
