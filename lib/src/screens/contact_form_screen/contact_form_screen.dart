import 'package:flutter/material.dart';

import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/contact_form_widget/contact_form_widget.dart';

import 'package:contact_list/src/widgets/custom_app_bar_widget.dart';

class ContactFormScreen extends StatelessWidget {
  const ContactFormScreen({
    super.key,
    this.objectId,
  });

  final String? objectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(
        title: 'Adicionar contato',
      ),
      body: ContactFormWidget(
        screenContext: context,
        objectId: objectId,
      ),
    );
  }
}
