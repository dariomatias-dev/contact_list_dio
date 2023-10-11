import 'package:flutter/material.dart';

import 'package:contact_list/src/screens/search_screen/components/research_field_widget.dart';

import 'package:contact_list/src/widgets/custom_app_bar_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(
        actions: <Widget>[
          ResearchFieldWidget(),
        ],
      ),
      body: Container(),
    );
  }
}
