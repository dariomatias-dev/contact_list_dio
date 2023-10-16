import 'package:flutter/material.dart';

Widget? verificationsHelper(AsyncSnapshot<dynamic> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const SizedBox(
      height: 140.0,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  } else if (snapshot.hasError) {
    return const SizedBox(
      height: 140.0,
      child: Text(
        'Ocorreu um problema ao carregar os dados',
      ),
    );
  }

  return null;
}
