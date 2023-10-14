import 'package:dio/dio.dart';

import 'package:contact_list/src/core/rest_client/rest_client.dart';

import 'package:contact_list/src/models/contact_model.dart';

class ContactsService {
  final Dio dio = dioConfigured();

  void createContact(ContactModel contact) {}

  Future<List<ContactModel>> getContacts() async {
    final Response response = await dio.get('');
    final Map<String, dynamic> data = response.data;
    final List<dynamic> results = data['results'];

    final List<ContactModel> contacts = results.map((result) {
      return ContactModel.fromMap(result);
    }).toList();

    return contacts;
  }

  void removeContact(String number) {}
}

