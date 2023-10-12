import 'package:flutter/material.dart';

import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/show_modal_bottom_sheet.dart';

class ChooseAvatarIconWidget extends StatelessWidget {
  const ChooseAvatarIconWidget({
    super.key,
    required this.screenContext,
  });

  final BuildContext screenContext;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey.shade100,
                  child: Icon(
                    Icons.person,
                    color: Colors.grey.shade800,
                    size: 40.0,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 9.0,
            bottom: 9.0,
            child: GestureDetector(
              onTap: () {
                showOptions(screenContext);
              },
              child: Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
