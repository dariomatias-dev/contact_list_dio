import 'package:flutter/material.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/widgets/contact_card_widget/contact_card_widget.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({
    super.key,
    required this.contacts,
    required this.onRefresh,
  });

  final List<ContactModel> contacts;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            child: Column(
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
            ),
          ),
        ],
      ),
    );
  }
}
