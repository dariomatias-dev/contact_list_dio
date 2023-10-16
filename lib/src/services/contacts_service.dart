import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'package:contact_list/src/core/rest_client/rest_client.dart';

import 'package:contact_list/src/notifiers/contacts_service_notifier.dart';

import 'package:contact_list/src/models/contact_model.dart';

class ContactsService {
  final logger = Logger();
  final Dio dio = dioConfigured();

  Future<void> createContact(ContactModel contact) async {
    final Map<String, dynamic> map = removeNullValues(
      contact.toMap(),
    );

    try {
      await dio.post(
        '',
        data: map,
      );
      contactsServiceNotifier.notify();
    } catch (err, stackTrace) {
      logger.e(
        'Error: $err',
        stackTrace: stackTrace,
      );
    }
  }

  Future<ContactModel?> getContact(String objectId) async {
    try {
      final String queries = '?where={"objectId":"$objectId"}';
      final Response response = await dio.get(queries);
      final Map<String, dynamic> data = response.data;
      final List<dynamic> results = data['results'];

      return results.isNotEmpty ? ContactModel.fromMap(results[0]) : null;
    } catch (err, stackTrace) {
      logger.e(
        'Error: $err',
        stackTrace: stackTrace,
      );

      return null;
    }
  }

  Future<List<ContactModel>?> getContactsByNumber(String number) async {
    try {
      final String queries = '?where={"number": {"\$regex": "\\\\$number"}}';
      final Response response = await dio.get(queries);
      final Map<String, dynamic> data = response.data;
      final List<dynamic> results = data['results'];

      final List<ContactModel> contacts = results.map((result) {
        return ContactModel.fromMap(result);
      }).toList();

      return contacts;
    } catch (err, stackTrace) {
      logger.e(
        'Error: $err',
        stackTrace: stackTrace,
      );

      return null;
    }
  }

  Future<List<ContactModel>?> getContacts() async {
    try {
      final Response response = await dio.get('');
      final Map<String, dynamic> data = response.data;
      final List<dynamic> results = data['results'];

      final List<ContactModel> contacts = results.map((result) {
        return ContactModel.fromMap(result);
      }).toList();

      return contacts;
    } catch (err, stackTrace) {
      logger.e(
        'Error: $err',
        stackTrace: stackTrace,
      );

      return null;
    }
  }

  Future<void> updateContact(String objectId, ContactModel contact) async {
    final Map<String, dynamic> map = removeNullValues(
      contact.toMap(),
    );

    try {
      await dio.put(
        objectId,
        data: map,
      );
      contactsServiceNotifier.notify();
    } catch (err, stackTrace) {
      logger.e(
        'Error: $err',
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> removeContact(String objectId) async {
    try {
      await dio.delete(objectId);
      contactsServiceNotifier.notify();
    } catch (err, stackTrace) {
      logger.e(
        'Error: $err',
        stackTrace: stackTrace,
      );
    }
  }
}

Map<String, dynamic> removeNullValues(
  final Map<String, dynamic> map,
) {
  final Map<String, dynamic> resultMap = {};

  map.forEach((key, value) {
    if (value != null) {
      resultMap[key] = value;
    }
  });

  return resultMap;
}
