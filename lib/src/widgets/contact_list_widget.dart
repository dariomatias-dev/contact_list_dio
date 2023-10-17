import 'package:flutter/material.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/widgets/contact_card_widget.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({
    super.key,
    required this.contacts,
  });

  final List<ContactModel> contacts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        ListView.separated(
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
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
