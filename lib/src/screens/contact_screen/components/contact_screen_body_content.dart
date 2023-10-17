import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:contact_list/src/models/contact_model.dart';

import 'package:contact_list/src/widgets/profile_icon_widget.dart';

class ContactScreenBodyContent extends StatelessWidget {
  const ContactScreenBodyContent({
    super.key,
    required this.contact,
  });

  final ContactModel contact;

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final String createdAt = formatDate(contact.createdAt!);
    final String updatedAt = formatDate(contact.updatedAt!);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10.0),
                ProfileIconWidget(
                  profilePicturePath: contact.profilePicturePath,
                ),
                const SizedBox(height: 12.0),
                Text(
                  contact.name,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Número ',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      contact.number,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (contact.nickname != null &&
                    contact.nickname!.isNotEmpty) ...[
                  Row(
                    children: [
                      const Text(
                        'Apelido: ',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        contact.nickname!,
                        style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                ],
                if (contact.email != null && contact.email!.isNotEmpty) ...[
                  Row(
                    children: [
                      const Text(
                        'Email: ',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        contact.email!,
                        style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                ],
                if (contact.address != null && contact.address!.isNotEmpty) ...[
                  Row(
                    children: [
                      const Text(
                        'Endereço: ',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        contact.address!,
                        style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                ],
                Row(
                  children: [
                    const Text(
                      'Criado em: ',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      createdAt,
                      style: const TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    const Text(
                      'Atualizado em: ',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      updatedAt,
                      style: const TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                if (contact.grades != null && contact.grades!.isNotEmpty) ...[
                  const Text(
                    'Nota',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  TextFormField(
                    initialValue: contact.grades,
                    textAlign: TextAlign.justify,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      hintText: 'Adicione uma nota',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
