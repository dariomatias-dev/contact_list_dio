import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:contact_list/src/widgets/contact_card_widget/slidable_action_widget.dart';

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget({
    super.key,
    required this.name,
    required this.number,
  });

  final String name;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.40,
        motion: const BehindMotion(),
        children: [
          SlidableActionWidget(
            title: 'Editar',
            icon: Icons.edit,
            action: () {},
          ),
          SlidableActionWidget(
            title: 'Remover',
            icon: Icons.delete,
            action: () {},
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Image.network(
                'https://i.pinimg.com/564x/ed/c8/2c/edc82cb163f9adb1a0dcc37f1d48f0d9.jpg',
                width: 60.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  number,
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
