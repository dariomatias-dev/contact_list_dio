import 'package:flutter/material.dart';

import 'package:contact_list/src/enums/enums.dart';

import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/contact_form_widget/contact_form_widget.dart';

import 'package:contact_list/src/widgets/custom_app_bar_widget/custom_app_bar_widget.dart';

class ContactFormScreen extends StatelessWidget {
  const ContactFormScreen({
    super.key,
    required this.formType,
    this.objectId,
    this.updateScreen,
  }) : assert(
          !(formType == FormTypeEnum.update && objectId == null),
          'When the form is of the update type, the objectId is mandatory.',
        );

  final FormTypeEnum formType;
  final String? objectId;
  final VoidCallback? updateScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        title: formType == FormTypeEnum.create
            ? 'Adicionar contato'
            : 'Atualizar contato',
      ),
      body: ContactFormWidget(
        screenContext: context,
        objectId: objectId,
        formType: formType,
        updateScreen: updateScreen,
      ),
    );
  }
}
