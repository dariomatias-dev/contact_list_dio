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
      controller: formField.controller,
      maxLines: formField.maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: formField.title,
        alignLabelWithHint: true,
        hintText: formField.placeholder,
      ),
    );
  }
}
