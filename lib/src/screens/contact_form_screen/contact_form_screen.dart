import 'package:flutter/material.dart';

import 'package:contact_list/src/enums/enums.dart';

import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/contact_form_widget/contact_form_widget.dart';

import 'package:contact_list/src/widgets/custom_app_bar_widget.dart';

class ContactFormScreen extends StatelessWidget {
  const ContactFormScreen({
    super.key,
    required this.typeForm,
    this.objectId,
  });

  final FormTypeEnum typeForm;
  final String? objectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        title: typeForm == FormTypeEnum.create
            ? 'Adicionar contato'
            : 'Atualizar contato',
      ),
      body: ContactFormWidget(
        screenContext: context,
        typeForm: typeForm,
        objectId: objectId,
      ),
    );
  }
}
