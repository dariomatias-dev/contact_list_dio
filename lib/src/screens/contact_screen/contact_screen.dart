import 'package:contact_list/src/core/helpers/navigation_fade_transition_help.dart';
import 'package:contact_list/src/core/routes/contact_list_route_names.dart';
import 'package:contact_list/src/enums/enums.dart';
import 'package:contact_list/src/screens/contact_form_screen/contact_form_screen.dart';
import 'package:flutter/material.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/screens/contact_screen/components/contact_screen_body_content.dart';

import 'package:contact_list/src/utils/show_delete_confirmation_dialog.dart';

import 'package:contact_list/src/widgets/custom_app_bar_widget.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({
    super.key,
    required this.contact,
  });

  final ContactModel contact;

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
            itemBuilder: (context) => <PopupMenuItem>[
              PopupMenuItem(
                onTap: () {
                  navigationFadeTransitionHelp(
                    context,
                    ContactListRouteNames.contactForm,
                    () => ContactFormScreen(
                      formType: FormTypeEnum.update,
                      objectId: contact.objectId,
                    ),
                  );
                },
                child: const Text(
                  'Atualizar',
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  showDeleteConfirmationDialog(
                    context,
                    contact.objectId!,
                  );
                },
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
