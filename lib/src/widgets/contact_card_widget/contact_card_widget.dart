import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:contact_list/src/core/helpers/navigation_fade_transition_help.dart';
import 'package:contact_list/src/core/routes/contact_list_route_names.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/screens/contact_screen/contact_screen.dart';

import 'package:contact_list/src/widgets/contact_card_widget/slidable_action_widget.dart';

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget({
    super.key,
    required this.screenContext,
    required this.contact,
  });

  final ContactModel contact;
  final BuildContext screenContext;

  void _showAlertDialog() {
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
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.40,
        motion: const BehindMotion(),
        children: [
          SlidableActionWidget(
            title: 'Editar',
            icon: Icons.edit,
            action: () {},
            backgroundColor: Colors.blue.shade400,
          ),
          SlidableActionWidget(
            title: 'Remover',
            icon: Icons.delete,
            action: _showAlertDialog,
            backgroundColor: Colors.red.shade400,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          navigationFadeTransitionHelp(
            screenContext,
            ContactListRouteNames.contact,
            () => ContactScreen(contact: contact),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Image.network(
                  'https://i.pinimg.com/564x/ed/c8/2c/edc82cb163f9adb1a0dcc37f1d48f0d9.jpg',
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.cover,
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
            ],
          ),
        ),
      ),
    );
  }
}
