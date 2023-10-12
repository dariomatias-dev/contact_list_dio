import 'package:flutter/material.dart';

class FormFieldModel {
  FormFieldModel({
    required this.title,
    required this.placeholder,
    required this.controller,
    this.maxLines,
  });

  final String title;
  final String placeholder;
  final TextEditingController controller;
  final int? maxLines;
}
