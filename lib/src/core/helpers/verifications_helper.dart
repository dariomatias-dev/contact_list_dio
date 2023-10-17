import 'package:flutter/material.dart';

import 'package:contact_list/src/widgets/elegant_message_widget.dart';

Widget? verificationsHelper(
  AsyncSnapshot<dynamic> snapshot, {
  bool checkValueNull = true,
}) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const CircularProgressIndicator();
  } else if (snapshot.hasError || (checkValueNull && snapshot.data == null)) {
    return const ElegantMessageWidget(
      message: 'Ocorreu um problema ao carregar os dados',
    );
  }

  return null;
}
