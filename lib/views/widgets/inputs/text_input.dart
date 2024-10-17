import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.autofocus = false,
    this.decoration,
    this.onChanged,
  });

  final String? labelText;
  final TextEditingController? controller;
  final bool autofocus;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final void Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autofocus,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: decoration??InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
