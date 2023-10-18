import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
    required this.title,
    this.placeholder,
    required this.controller,
    this.inputFormatters,
    this.minLength,
    this.maxLines = 1,
    this.required = true,
  });

  final String title;
  final String? placeholder;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
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
      inputFormatters: inputFormatters,
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
