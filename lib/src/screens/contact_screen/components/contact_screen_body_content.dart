import 'package:flutter/material.dart';

import 'package:contact_list/src/models/contact_model.dart';
import 'package:intl/intl.dart';

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
    final String createdAt = formatDate(contact.createdAt);
    final String updatedAt = formatDate(contact.updatedAt);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/ed/c8/2c/edc82cb163f9adb1a0dcc37f1d48f0d9.jpg',
                ),
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
                contact.nickname,
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
                'Email: ',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                contact.email,
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
                'Endereço: ',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                contact.address,
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
            maxLines: 8,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
