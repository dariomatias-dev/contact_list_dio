import 'package:flutter/material.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/screens/contact_screen/components/contact_screen_body_content.dart';

import 'package:contact_list/src/widgets/custom_app_bar_widget.dart';

class ContactScreen extends StatelessWidget  {
  const ContactScreen({
    super.key,
    required this.contact,
  });

  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const CustomAppBarWidget(
        title: 'Contato',
      ),
      body: SingleChildScrollView(
        child: ContactScreenBodyContent(
          contact: contact,
        ),
      ),
    );
  }
}
