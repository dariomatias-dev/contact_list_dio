import 'package:flutter/material.dart';

import 'package:contact_list/src/models/form_field_model.dart';

List<FormFieldModel> formFields(List<TextEditingController> controllers) {
  return [
    FormFieldModel(
      title: 'Nome',
      placeholder: 'Dário Matias',
      controller: controllers[0],
    ),
    FormFieldModel(
      title: 'Apelido',
      placeholder: '',
      controller: controllers[1],
    ),
    FormFieldModel(
      title: 'Número',
      placeholder: '+55 (83) 98640-4371',
      controller: controllers[2],
    ),
    FormFieldModel(
      title: 'Email',
      placeholder: 'matiasdario75@gmail.com',
      controller: controllers[3],
    ),
    FormFieldModel(
      title: 'Endereço',
      placeholder: '',
      controller: controllers[4],
    ),
    FormFieldModel(
      title: 'Nota',
      placeholder: 'Ocupado durante a manhã',
      controller: controllers[5],
      maxLines: 6,
    ),
  ];
}
