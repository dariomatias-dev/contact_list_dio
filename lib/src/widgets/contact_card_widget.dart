import 'package:flutter/material.dart';

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget({
    super.key,
    required this.name,
    required this.number,
  });

  final String name;
  final String number;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(name),
      subtitle: Text(number),
    );
  }
}
