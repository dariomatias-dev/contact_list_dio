import 'package:flutter/material.dart';

import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget.dart';

import 'package:contact_list/src/widgets/custom_app_bar_widget.dart';

class ContactFormScreen extends StatelessWidget {
  const ContactFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        title: 'Adicionar contato',
      ),
      body: SingleChildScrollView(
        child: ContactFormWidget(),
      ),
    );
  }
}
