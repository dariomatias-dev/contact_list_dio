import 'package:flutter/material.dart';

import 'package:contact_list/src/screens/search_screen/components/research_field_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60.0,
        backgroundColor: Colors.white,
        leading: Tooltip(
          message: 'Sair',
          child: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        actions: const <Widget>[
          ResearchFieldWidget(),
        ],
      ),
    );
  }
}
