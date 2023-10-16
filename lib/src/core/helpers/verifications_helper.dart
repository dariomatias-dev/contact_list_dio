import 'package:flutter/material.dart';

Widget? verificationsHelper(AsyncSnapshot<dynamic> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const CircularProgressIndicator();
  } else if (snapshot.hasError) {
    return const Text(
      'Ocorreu um problema ao carregar os dados',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  return null;
}
