import 'package:flutter/material.dart';

import 'package:contact_list/src/core/helpers/verifications_helper.dart';

import 'package:contact_list/src/models/basic_contact_model.dart';

import 'package:contact_list/src/screens/search_screen/components/research_field_widget.dart';

import 'package:contact_list/src/services/contacts_service.dart';

import 'package:contact_list/src/widgets/contact_list_widget/contact_list_widget.dart';
import 'package:contact_list/src/widgets/custom_app_bar_widget.dart';
import 'package:contact_list/src/widgets/elegant_message_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ContactsService contactsService = ContactsService();
  String query = '';
  bool showContent = false;

  void search(String value) {
    if (value.isEmpty) {
      setState(() {
        showContent = false;
      });
    } else {
      setState(() {
        showContent = true;
        query = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        actions: <Widget>[
          ResearchFieldWidget(
            search: search,
          ),
        ],
      ),
      body: showContent
          ? FutureBuilder(
              future: contactsService.getContactsByNumber(query),
              builder: (context, snapshot) {
                final verificationsResult = verificationsHelper(snapshot);

                if (verificationsResult != null) {
                  return Center(
                    child: verificationsResult,
                  );
                }

                final List<BasicContactModel> contacts = snapshot.data!;

                return ContactListWidget(
                  contacts: contacts,
                );
              },
            )
          : const Center(
              child: ElegantMessageWidget(
                message: 'Comece digitando um contato no campo acima',
              ),
            ),
    );
  }
}
