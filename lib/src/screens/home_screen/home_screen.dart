import 'package:contact_list/src/widgets/contact_card_widget.dart';
import 'package:flutter/material.dart';

class ContactListModel {
  ContactListModel({
    required this.name,
    required this.number,
  });

  final String name;
  final String number;
}

final List<ContactListModel> contacts = <ContactListModel>[
  ContactListModel(
    name: 'Dário',
    number: '+55 (83) 98640-4371',
  ),
  ContactListModel(
    name: 'Silva',
    number: '+55 (83) 97832-0725',
  ),
  ContactListModel(
    name: 'Luiz',
    number: '+55 (83) 96293-0265',
  ),
  ContactListModel(
    name: 'Mariana',
    number: '+55 (83) 97143-7193',
  ),
  ContactListModel(
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
            onPressed: () {},
            icon: Icon(
              Icons.search_sharp,
              color: Colors.blue.shade400,
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: <Widget>[
              const Divider(),
              ListView.builder(
                itemCount: contacts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final ContactListModel contact = contacts.elementAt(index);

                  return ContactCardWidget(
                    name: contact.name,
                    number: contact.number,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue.shade400,
        child: const Icon(Icons.add),
      ),
    );
  }
}
