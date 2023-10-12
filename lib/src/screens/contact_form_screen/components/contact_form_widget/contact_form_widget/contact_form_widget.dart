import 'package:flutter/material.dart';

import 'package:contact_list/src/models/form_field_model.dart';

import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/choose_avatar_icon_widget.dart';
import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/contact_form_widget/form_field_widget.dart';
import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/contact_form_widget/form_fields.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<FormFieldModel> _formFields = [];

  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _nicknameFieldController =
      TextEditingController();
  final TextEditingController _numberFieldController = TextEditingController();
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _addressFieldController = TextEditingController();
  final TextEditingController _gradesFieldController = TextEditingController();

  @override
  void initState() {
    _formFields = formFields([
      _nameFieldController,
      _nicknameFieldController,
      _numberFieldController,
      _emailFieldController,
      _addressFieldController,
      _gradesFieldController,
    ]);

    super.initState();
  }

  @override
  void dispose() {
    for (FormFieldModel fieldController in _formFields) {
      fieldController.controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Divider(),
            ),
            const SizedBox(height: 20.0),
            ChooseAvatarIconWidget(
              screenContext: context,
            ),
            const SizedBox(height: 16.0),
            ListView.separated(
              itemCount: _formFields.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16.0);
              },
              itemBuilder: (context, index) {
                final FormFieldModel formField = _formFields[index];

                return FormFieldWidget(
                  formField: formField,
                );
              },
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Adicionar'),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
