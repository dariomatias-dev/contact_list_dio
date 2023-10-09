import 'package:flutter/material.dart';

import 'package:contact_list/src/models/contact_model.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({
    super.key,
    required this.contact,
  });

  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Tooltip(
          message: 'Sair',
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          contact.name,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
