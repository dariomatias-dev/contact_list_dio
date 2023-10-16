import 'package:flutter/material.dart';

import 'package:contact_list/src/screens/search_screen/components/research_field_widget.dart';

import 'package:contact_list/src/widgets/custom_app_bar_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  void updateQuery(String value) {
    setState(() {
      query = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        actions: <Widget>[
          ResearchFieldWidget(
            updateQuery: updateQuery,
          ),
        ],
      ),
      body: Container(),
    );
  }
}
