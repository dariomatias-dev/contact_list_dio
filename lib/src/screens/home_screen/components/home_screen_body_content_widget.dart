import 'package:flutter/material.dart';

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
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 140.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError || snapshot.data == null) {
                return const SizedBox(
                  height: 140.0,
                  child: Text(
                    'Ocorreu um problema ao carregar os dados',
                  ),
                );
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
