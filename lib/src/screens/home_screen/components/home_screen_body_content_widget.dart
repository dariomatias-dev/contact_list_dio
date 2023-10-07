import 'package:flutter/material.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/widgets/contact_card_widget/contact_card_widget.dart';

class HomeScreenBodyContentWidget extends StatelessWidget {
  const HomeScreenBodyContentWidget({
    super.key,
    required this.contacts,
  });

  final List<ContactModel> contacts;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Divider(),
          ),
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
                name: contact.name,
                number: contact.number,
              );
            },
          ),
        ],
      ),
    );
  }
}
