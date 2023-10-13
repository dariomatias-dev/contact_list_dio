import 'package:flutter/material.dart';

class FormFieldModel {
  FormFieldModel({
    required this.title,
    required this.placeholder,
    required this.controller,
    this.minLength,
    this.maxLines = 1,
    this.required = true,
  });

  final String title;
  final String placeholder;
  final TextEditingController controller;
  final int? minLength;
  final int maxLines;
  final bool required;
}
