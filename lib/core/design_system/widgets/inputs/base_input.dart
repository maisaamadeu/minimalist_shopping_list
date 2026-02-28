import 'package:flutter/material.dart';

class BaseInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const BaseInput({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }
}
