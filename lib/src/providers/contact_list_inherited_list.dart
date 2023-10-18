import 'package:flutter/material.dart';

class ContactListInheritedWidget extends InheritedWidget {
  const ContactListInheritedWidget({
    super.key,
    required this.updateContactScreen,
    required final Widget child,
  }) : super(child: child);

  final ValueNotifier<bool> updateContactScreen;

  static ContactListInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ContactListInheritedWidget>();
  }

  @override
  bool updateShouldNotify(ContactListInheritedWidget oldWidget) {
    return true;
  }
}
