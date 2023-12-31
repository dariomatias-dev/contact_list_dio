import 'package:flutter/material.dart';

import 'package:contact_list/src/core/routes/contact_list_routes.dart';

class ContactListApp extends StatefulWidget {
  const ContactListApp({super.key});

  @override
  State<ContactListApp> createState() => _ContactListAppState();
}

class _ContactListAppState extends State<ContactListApp> {
  final ValueNotifier<bool> updateContactScreen = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lista de Contatos',
        debugShowCheckedModeBanner: false,
        routes: contactListRoutes,
      );
  }
}
