import 'package:flutter/material.dart';

import 'package:contact_list/src/core/helpers/navigation_fade_transition_help.dart';
import 'package:contact_list/src/core/routes/contact_list_route_names.dart';

import 'package:contact_list/src/enums/enums.dart';

import 'package:contact_list/src/screens/contact_form_screen/contact_form_screen.dart';

import 'package:contact_list/src/screens/home_screen/components/home_screen_body_content_widget.dart';

import 'package:contact_list/src/screens/search_screen/search_screen.dart';

import 'package:contact_list/src/widgets/custom_app_bar_bottom_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 56.0,
        title: const Text(
          'Contatos',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              navigationFadeTransitionHelp(
                context,
                ContactListRouteNames.search,
                () => const SearchScreen(),
              );
            },
            icon: Icon(
              Icons.search_sharp,
              color: Colors.blue.shade400,
            ),
          ),
          const SizedBox(width: 10.0),
        ],
        bottom: const CustomAppBarBottomWidget(),
      ),
      body: const HomeScreenBodyContentWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationFadeTransitionHelp(
            context,
            ContactListRouteNames.contactForm,
            () => const ContactFormScreen(
              formType: FormTypeEnum.create,
            ),
          );
        },
        backgroundColor: Colors.blue.shade400,
        child: const Icon(Icons.add),
      ),
    );
  }
}
