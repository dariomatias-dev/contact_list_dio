import 'package:flutter/material.dart';

import 'package:contact_list/src/notifiers/contacts_service_notifier.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/screens/home_screen/components/contact_list_widget.dart';

import 'package:contact_list/src/services/contacts_service.dart';

enum Status {
  loading,
  hasData,
  empty,
}

class HomeScreenBodyContentWidget extends StatefulWidget {
  const HomeScreenBodyContentWidget({
    super.key,
  });

  @override
  State<HomeScreenBodyContentWidget> createState() =>
      _HomeScreenBodyContentWidgetState();
}

class _HomeScreenBodyContentWidgetState
    extends State<HomeScreenBodyContentWidget> {
  final ContactsService contactsService = ContactsService();
  List<ContactModel> _contacts = [];
  Status? status;

  bool _isRefresh = false;

  Future<void> _onRefresh() async {
    _isRefresh = true;

    await _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      status = Status.loading;
    });

    final List<ContactModel?> result = await contactsService.getContacts();

    if (result.isEmpty) {
      setState(() {
        status = Status.empty;
      });
    } else {
      setState(() {
        status = Status.hasData;
        _contacts = result as List<ContactModel>;
      });
    }

    _isRefresh = false;
  }

  @override
  void initState() {
    contactsServiceNotifier.onContactsServiceCalled.listen((_) {
      setState(() {});
    });

    _fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (status == Status.loading && !_isRefresh) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (status == Status.empty) {
      return const Center(
        child: Text(
          'Ainda não há nenhum contato',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return ContactListWidget(
      contacts: _contacts,
      onRefresh: _onRefresh,
    );
  }
}
