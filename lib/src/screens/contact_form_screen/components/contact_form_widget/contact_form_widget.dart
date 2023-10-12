import 'package:flutter/material.dart';

import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/choose_avatar_icon_widget.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Divider(),
          ),
          const SizedBox(height: 16.0),
          ChooseAvatarIconWidget(
            screenContext: context,
          )
        ],
      ),
    );
  }
}
