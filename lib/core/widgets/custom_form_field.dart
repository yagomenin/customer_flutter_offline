import 'package:customer_flutter_offline/core/styles/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    required this.hintText,
    required this.onChanged,
    required this.validator,
    required this.controller,
    this.inputFormatters,
    super.key,
  });

  final String hintText;
  final Function(String? value) onChanged;
  final String? Function(String? value) validator;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(Space.md - 2)),
        ),
      ),
      inputFormatters: inputFormatters,
    );
  }
}
