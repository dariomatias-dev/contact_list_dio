import 'package:contact_list/src/models/basic_contact_model.dart';
import 'package:flutter/material.dart';

import 'package:contact_list/src/enums/enums.dart';

import 'package:contact_list/src/notifiers/contacts_service_notifier.dart';

import 'package:contact_list/src/services/contacts_service.dart';

import 'package:contact_list/src/widgets/contact_list_widget/contact_list_widget.dart';
import 'package:contact_list/src/widgets/elegant_message_widget.dart';

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
  List<BasicContactModel> _contacts = [];
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

    final List<BasicContactModel>? result = await contactsService.getContacts();

    if (result == null) {
      setState(() {
        status = Status.hasError;
      });
    } else if (result.isEmpty) {
      setState(() {
        status = Status.empty;
      });
    } else {
      setState(() {
        status = Status.hasData;
        _contacts = result;
      });
    }

    _isRefresh = false;
  }

  @override
  void initState() {
    contactsServiceNotifier.onContactsServiceCalled.listen((_) {
      _fetchData();
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
    } else if (status == Status.hasError) {
      return const Center(
        child: ElegantMessageWidget(
          message: 'Ocorreu um problema ao carregar os dados',
        ),
      );
    } else if (status == Status.empty) {
      return const Center(
        child: ElegantMessageWidget(
          message: 'Ainda não há nenhum contato',
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ContactListWidget(
        contacts: _contacts,
      ),
    );
  }
}