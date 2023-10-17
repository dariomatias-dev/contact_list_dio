import 'package:flutter/material.dart';

import 'package:intl_phone_number_field/intl_phone_number_field.dart';

class PhoneNumberInputWidget extends StatelessWidget {
  const PhoneNumberInputWidget({
    super.key,
    required this.updateNumber,
  });

  final void Function(String) updateNumber;

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      betweenPadding: 10.0,
      countryConfig: CountryConfig(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade500,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      phoneConfig: PhoneConfig(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        borderWidth: 1,
        enabledColor: Colors.grey.shade500,
        focusedColor: Colors.blue,
        errorColor: Colors.red.shade700,
        labelText: 'Número de telefone',
        radius: 4.0,
        errorStyle: TextStyle(
          color: Colors.red.shade700,
          fontSize: 12.0,
        ),
        errorPadding: const EdgeInsets.only(
          top: 8.0,
          left: 10.0,
        ),
      ),
      validator: (number) {
        if (number.number.isEmpty) {
          return 'Insira algum valor';
        }

        return null;
      },
      onInputChanged: (number) {
        final String value = '${number.dial_code} ${number.number}';

        updateNumber(value);
      },
    );
  }
}
