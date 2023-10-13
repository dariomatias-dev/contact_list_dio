import 'package:flutter/material.dart';

import 'package:contact_list/src/models/form_field_model.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
    required this.formField,
  });

  final FormFieldModel formField;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: formField.controller,
      maxLines: formField.maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: formField.title,
        alignLabelWithHint: true,
        hintText: formField.placeholder,
      ),
      validator: (value) {
        final String? trimmedValue = value?.trim();

        if (trimmedValue == null ||
            (formField.required && trimmedValue.isEmpty)) {
          return 'Insira algum valor';
        } else if (trimmedValue.isNotEmpty &&
            formField.minLength != null &&
            trimmedValue.length < formField.minLength!) {
          return 'A quantidade mínima de caracteres é ${formField.minLength}';
        }

        return null;
      },
    );
  }
}
