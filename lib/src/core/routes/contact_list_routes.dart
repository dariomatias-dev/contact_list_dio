import 'package:flutter/material.dart';

import 'package:contact_list/src/core/routes/contact_list_route_names.dart';

import 'package:contact_list/src/screens/home_screen/home_screen.dart';

final Map<String, Widget Function(dynamic)> contactListRoutes = {
  ContactListRouteNames.home: (_) => const HomeScreen(),
};
