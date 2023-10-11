import 'package:contact_list/src/screens/contact_form_screen/contact_form_screen.dart';
import 'package:flutter/material.dart';

import 'package:contact_list/src/core/helpers/navigation_fade_transition_help.dart';
import 'package:contact_list/src/core/routes/contact_list_route_names.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/screens/home_screen/components/home_screen_body_content_widget.dart';
import 'package:contact_list/src/screens/search_screen/search_screen.dart';

final List<ContactModel> contacts = <ContactModel>[
  ContactModel(
    name: 'Dário',
    nickname: '',
    number: '+55 (83) 98640-4371',
    email: 'matiasdario75@gmail.com',
    address: 'Praça Central, 789',
    grades: '',
    createdAt: DateTime(2023, 6, 10),
    updatedAt: DateTime(2023, 8, 30),
  ),
  ContactModel(
    name: 'Silva',
    nickname: 'Silvana',
    number: '+55 (83) 97832-0725',
    email: 'silva@gmail.com',
    address: 'Estrada Secundária, 321',
    grades:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    createdAt: DateTime(2023, 7, 5),
    updatedAt: DateTime(2023, 9, 15),
  ),
  ContactModel(
    name: 'Luiz',
    nickname: 'Lu',
    number: '+55 (83) 96293-0265',
    email: 'luiz@gmail.com',
    address: 'Avenida Norte, 654',
    grades: '',
    createdAt: DateTime(2023, 8, 1),
    updatedAt: DateTime(2023, 10, 5),
  ),
  ContactModel(
    name: 'Mariana',
    nickname: 'Mari',
    number: '+55 (83) 97143-7193',
    email: 'mariana@gmail.com',
    address: 'Rua das Flores, 123',
    grades:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    createdAt: DateTime(2023, 4, 15),
    updatedAt: DateTime(2023, 10, 1),
  ),
  ContactModel(
    name: 'Clara',
    nickname: '',
    number: '+55 (83) 99165-9105',
    email: 'clara@gmail.com',
    address: 'Avenida Principal, 456',
    grades:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
    createdAt: DateTime(2023, 5, 20),
    updatedAt: DateTime(2023, 9, 25),
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
        onPressed: () {
          navigationFadeTransitionHelp(
            context,
            ContactListRouteNames.contactForm,
            () => const ContactFormScreen(),
          );
        },
        backgroundColor: Colors.blue.shade400,
        child: const Icon(Icons.add),
      ),
    );
  }
}
