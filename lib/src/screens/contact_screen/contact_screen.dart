import 'package:flutter/material.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/screens/contact_screen/components/contact_screen_body_content.dart';

import 'package:contact_list/src/widgets/custom_app_bar_widget.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({
    super.key,
    required this.contact,
  });

  final ContactModel contact;

  void updateContact(BuildContext screenContext) {
    _showAlertDialog(screenContext, 'Atualizar contato');
  }

  void deleteContact(BuildContext screenContext) {
    _showAlertDialog(screenContext, 'Excluir contato');
  }

  void _showAlertDialog(BuildContext screenContext, String title) {
    showDialog(
      context: screenContext,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: CustomAppBarWidget(
        title: 'Contato',
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.black,
            ),
            onSelected: (value) {
              value(context);
            },
            itemBuilder: (context) => <PopupMenuItem>[
              PopupMenuItem(
                value: updateContact,
                child: const Text(
                  'Atualizar',
                ),
              ),
              PopupMenuItem(
                value: deleteContact,
                child: const Text(
                  'Excluir',
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: ContactScreenBodyContent(
          contact: contact,
        ),
      ),
    );
  }
}
