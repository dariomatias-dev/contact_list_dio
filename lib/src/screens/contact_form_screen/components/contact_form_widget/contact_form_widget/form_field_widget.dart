import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
    required this.title,
    this.placeholder,
    required this.controller,
    this.minLength,
    this.maxLines = 1,
    this.required = true,
  });

  final String title;
  final String? placeholder;
  final TextEditingController controller;
  final int? minLength;
  final int maxLines;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: title,
        alignLabelWithHint: true,
        hintText: placeholder,
      ),
      validator: (value) {
        final String? trimmedValue = value?.trim();

        if (trimmedValue == null || (required && trimmedValue.isEmpty)) {
          return 'Insira algum valor';
        } else if (trimmedValue.isNotEmpty &&
            minLength != null &&
            trimmedValue.length < minLength!) {
          return 'A quantidade mínima de caracteres é $minLength';
        }

        return null;
      },
    );
  }
}
