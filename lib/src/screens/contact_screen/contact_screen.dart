import 'package:contact_list/src/screens/contact_screen/components/contact_screen_body_content.dart';
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
        title: const Text(
          'Contato',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ContactScreenBodyContent(
          contact: contact,
        ),
      ),
    );
  }
}
