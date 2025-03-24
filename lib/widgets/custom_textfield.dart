import 'package:flutter/material.dart';
import 'package:video_streaming_app/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onTap;
  const CustomTextfield({super.key, required this.controller, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onTap,
      controller: controller,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: buttonColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryBackgroundColor,
          ),
        ),
      ),
    );
  }
}
