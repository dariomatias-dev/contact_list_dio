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
          'Lista de Contatos',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.clear_rounded,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search_sharp),
                    ),
                  ),
                ),
              ),
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
