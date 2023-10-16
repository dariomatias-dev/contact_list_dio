import 'package:flutter/material.dart';

import 'package:contact_list/src/core/helpers/verifications_helper.dart';

import 'package:contact_list/src/notifiers/contacts_service_notifier.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/services/contacts_service.dart';

import 'package:contact_list/src/widgets/contact_card_widget/contact_card_widget.dart';

class HomeScreenBodyContentWidget extends StatefulWidget {
  const HomeScreenBodyContentWidget({
    super.key,
  });

  @override
  State<HomeScreenBodyContentWidget> createState() =>
      _HomeScreenBodyContentWidgetState();
}

class _HomeScreenBodyContentWidgetState
    extends State<HomeScreenBodyContentWidget> {
  final ContactsService contactsService = ContactsService();

  @override
  void initState() {
    contactsServiceNotifier.onContactsServiceCalled.listen((_) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Divider(),
          ),
          const SizedBox(height: 10.0),
          FutureBuilder(
            future: contactsService.getContacts(),
            builder: (context, snapshot) {
              final verificationsResult = verificationsHelper(snapshot);

              if (verificationsResult != null) {
                return verificationsResult;
              }

              final contacts = snapshot.data!;

              if (contacts.isEmpty) {
                return const SizedBox(
                  height: 140.0,
                  child: Text(
                    'Ainda não há nenhum contato',
                  ),
                );
              }

              return ListView.separated(
                itemCount: contacts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
                itemBuilder: (context, index) {
                  final ContactModel contact = contacts.elementAt(index);

                  return ContactCardWidget(
                    screenContext: context,
                    contact: contact,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
