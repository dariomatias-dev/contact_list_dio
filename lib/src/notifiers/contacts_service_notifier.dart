import 'dart:async';

class ContactsServiceNotifier {
  final _controller = StreamController<void>.broadcast();

  Stream<void> get onContactsServiceCalled => _controller.stream;

  void notify() {
    _controller.add(null);
  }

  void dispose() {
    _controller.close();
  }
}

final contactsServiceNotifier = ContactsServiceNotifier();
