import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:contact_list/src/models/basic_contact_model.dart';

import 'package:contact_list/src/widgets/contact_list_widget/contact_card_widget.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({
    super.key,
    required this.contacts,
  });

  final List<BasicContactModel> contacts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        AnimationLimiter(
          child: ListView.separated(
            itemCount: contacts.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10.0,
              );
            },
            itemBuilder: (context, index) {
              final BasicContactModel contact = contacts.elementAt(index);

              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(
                  milliseconds: 375,
                ),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: ContactCardWidget(
                      screenContext: context,
                      contact: contact,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
