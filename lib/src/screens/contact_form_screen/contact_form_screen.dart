import 'package:flutter/material.dart';

import 'package:contact_list/src/widgets/custom_app_bar_widget.dart';

class ContactFormScreen extends StatelessWidget {
  const ContactFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(),
      body: Container(),
    );
  }
}
