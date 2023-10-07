import 'package:flutter/material.dart';

import 'package:contact_list/src/core/helpers/navigation_fade_transition_help.dart';
import 'package:contact_list/src/core/routes/contact_list_route_names.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/screens/home_screen/components/home_screen_body_content_widget.dart';
import 'package:contact_list/src/screens/search_screen/search_screen.dart';

final List<ContactModel> contacts = <ContactModel>[
  ContactModel(
    name: 'Dário',
    number: '+55 (83) 98640-4371',
  ),
  ContactModel(
    name: 'Silva',
    number: '+55 (83) 97832-0725',
  ),
  ContactModel(
    name: 'Luiz',
    number: '+55 (83) 96293-0265',
  ),
  ContactModel(
    name: 'Mariana',
    number: '+55 (83) 97143-7193',
  ),
  ContactModel(
    name: 'Clara',
    number: '+55 (83) 99165-9105',
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Contatos',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              navigationFadeTransitionHelp(
                context,
                ContactListRouteNames.search,
                () => const SearchScreen(),
              );
            },
            icon: Icon(
              Icons.search_sharp,
              color: Colors.blue.shade400,
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: HomeScreenBodyContentWidget(
        contacts: contacts,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue.shade400,
        child: const Icon(Icons.add),
      ),
    );
  }
}
