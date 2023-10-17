import 'package:flutter/material.dart';

import 'package:contact_list/src/services/contacts_service.dart';

Future<bool> showDeleteConfirmationDialog(
  BuildContext screenContext,
  String objectId,
) async {
  final ContactsService contactsService = ContactsService();
  bool isConfirmed = false;

  await showDialog(
    context: screenContext,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: const Text('Aviso'),
        content: const Text(
          'Ao excluir o contato não será possível recuperá-lo, tenha certeza que realmente quer excluí-lo.',
          textAlign: TextAlign.justify,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(alertDialogContext);
            },
            child: const Text('Voltar'),
          ),
          TextButton(
            onPressed: () {
              contactsService.removeContact(objectId);

              Navigator.pop(alertDialogContext);
              isConfirmed = true;
            },
            child: const Text('Excluir'),
          ),
        ],
      );
    },
  );

  return isConfirmed;
}
