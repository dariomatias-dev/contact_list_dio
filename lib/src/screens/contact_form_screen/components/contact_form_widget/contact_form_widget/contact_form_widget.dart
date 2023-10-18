import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:contact_list/src/core/helpers/verifications_helper.dart';

import 'package:contact_list/src/enums/enums.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/providers/contact_list_inherited_list.dart';

import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/contact_form_widget/form_field_widget.dart';
import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/choose_avatar_icon_widget.dart';

import 'package:contact_list/src/services/contacts_service.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({
    super.key,
    required this.screenContext,
    required this.formType,
    this.objectId,
  });

  final BuildContext screenContext;
  final FormTypeEnum formType;
  final String? objectId;

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final ContactsService _contactsService = ContactsService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _profilePicturePath = '';
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _nicknameFieldController =
      TextEditingController();
  final TextEditingController _numberFieldController = TextEditingController();
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _addressFieldController = TextEditingController();
  final TextEditingController _gradesFieldController = TextEditingController();

  void _updateProfilePicturePath(String? path) {
    _profilePicturePath = path ?? '';
  }

  void _fillFields(ContactModel contact) {
    _profilePicturePath = contact.profilePicturePath ?? '';
    _nameFieldController.text = contact.name;
    _nicknameFieldController.text = contact.nickname ?? '';
    _numberFieldController.text =
        contact.number.split(' ').sublist(1).join(' ');
    _emailFieldController.text = contact.email ?? '';
    _addressFieldController.text = contact.address ?? '';
    _gradesFieldController.text = contact.grades ?? '';
  }

  Future<void> _fetchData() async {
    final ContactModel? contact = await _contactsService.getContact(
      widget.objectId!,
    );

    if (contact != null) _fillFields(contact);
  }

  @override
  void dispose() {
    _nameFieldController.dispose();
    _nicknameFieldController.dispose();
    _numberFieldController.dispose();
    _emailFieldController.dispose();
    _addressFieldController.dispose();
    _gradesFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FormTypeEnum formType = widget.formType;

    return FutureBuilder(
      future: formType == FormTypeEnum.create ? null : _fetchData(),
      builder: (context, snapshot) {
        final verificationsResult = verificationsHelper(
          snapshot,
          checkValueNull: false,
        );

        if (verificationsResult != null) {
          return Center(
            child: verificationsResult,
          );
        }

        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  ChooseAvatarIconWidget(
                    screenContext: context,
                    profilePicturePath: _profilePicturePath,
                    updateProfilePicturePath: _updateProfilePicturePath,
                  ),
                  const SizedBox(height: 16.0),
                  FormFieldWidget(
                    title: 'Nome',
                    placeholder: 'Dário Matias',
                    controller: _nameFieldController,
                  ),
                  const SizedBox(height: 16.0),
                  FormFieldWidget(
                    title: 'Apelido',
                    controller: _nicknameFieldController,
                    required: false,
                    minLength: 3,
                  ),
                  const SizedBox(height: 16.0),
                  FormFieldWidget(
                    title: 'Telefone',
                    placeholder: '+55 (83) 98640-4371',
                    controller: _numberFieldController,
                    inputFormatters: [
                      MaskTextInputFormatter(
                        mask: '+## (##) #####-####',
                        filter: {"#": RegExp(r'[0-9]')},
                      )
                    ],
                    minLength: 19,
                  ),
                  const SizedBox(height: 16.0),
                  FormFieldWidget(
                    title: 'Email',
                    placeholder: 'matiasdario75@gmail.com',
                    controller: _emailFieldController,
                    required: false,
                  ),
                  const SizedBox(height: 16.0),
                  FormFieldWidget(
                    title: 'Endereço',
                    controller: _addressFieldController,
                    required: false,
                    minLength: 3,
                  ),
                  const SizedBox(height: 16.0),
                  FormFieldWidget(
                    title: 'Nota',
                    placeholder: 'Ocupado durante a manhã',
                    controller: _gradesFieldController,
                    minLength: 3,
                    maxLines: 6,
                    required: false,
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final String name = _nameFieldController.text;
                          final String nickname = _nicknameFieldController.text;
                          final String number = _numberFieldController.text;
                          final String email = _emailFieldController.text;
                          final String address = _addressFieldController.text;
                          final String grades = _gradesFieldController.text;

                          final ContactModel contact = ContactModel(
                            profilePicturePath: _profilePicturePath,
                            name: name,
                            nickname: nickname,
                            number: number,
                            email: email,
                            address: address,
                            grades: grades,
                          );

                          if (formType == FormTypeEnum.create) {
                            _contactsService.createContact(contact);
                          } else {
                            final updateContactScreen =
                                ContactListInheritedWidget.of(context)!
                                    .updateContactScreen;

                            _contactsService.updateContact(
                              widget.objectId!,
                              contact,
                            );

                            updateContactScreen.value = true;
                          }

                          Navigator.pop(widget.screenContext);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(formType == FormTypeEnum.create
                          ? 'Adicionar'
                          : 'Atualizar'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
