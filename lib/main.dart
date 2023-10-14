import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:contact_list/src/contact_list_app.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(const ContactListApp());
}
