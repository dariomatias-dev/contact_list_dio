import 'package:flutter/material.dart';

class ElegantMessageWidget extends StatelessWidget {
  const ElegantMessageWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      textAlign: TextAlign.center,
      softWrap: true,
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
