import 'dart:io';

import 'package:flutter/material.dart';

import 'package:contact_list/src/core/helpers/navigation_fade_transition_help.dart';
import 'package:contact_list/src/core/routes/contact_list_route_names.dart';

import 'package:contact_list/src/enums/enums.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/screens/contact_form_screen/contact_form_screen.dart';
import 'package:contact_list/src/screens/contact_screen/contact_screen.dart';

import 'package:contact_list/src/services/contacts_service.dart';

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget({
    super.key,
    required this.screenContext,
    required this.contact,
  });

  final ContactModel contact;
  final BuildContext screenContext;

  void _showAlertDialog() {
    final ContactsService contactsService = ContactsService();

    showDialog(
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
                contactsService.removeContact(contact.objectId!);

                Navigator.pop(alertDialogContext);
              },
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigationFadeTransitionHelp(
          screenContext,
          ContactListRouteNames.contact,
          () => ContactScreen(contact: contact),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          right: 16.0,
          left: 30.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: contact.profilePicturePath != null
                    ? Image.file(
                        File(contact.profilePicturePath!),
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Icon(Icons.person),
                      ),
              ),
            ),
            const SizedBox(width: 14.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  contact.number,
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        navigationFadeTransitionHelp(
                          screenContext,
                          ContactListRouteNames.contactForm,
                          () => ContactFormScreen(
                            typeForm: FormTypeEnum.update,
                            objectId: contact.objectId,
                          ),
                        );
                      },
                      child: const Text('Editar'),
                    ),
                    PopupMenuItem(
                      onTap: _showAlertDialog,
                      child: const Text('Remover'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
