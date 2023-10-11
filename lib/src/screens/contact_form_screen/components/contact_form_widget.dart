import 'package:flutter/material.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return Wrap(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 6.0,
                width: 60.0,
                margin: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(28.0),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.photo,
              ),
              title: const Text('Galeria'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.camera_alt_rounded,
              ),
              title: const Text('Câmera'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.delete_outline_rounded,
              ),
              title: const Text('Remover'),
            ),
            const SizedBox(height: 20.0),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Divider(),
          ),
          const SizedBox(height: 16.0),
          Align(
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
                      _showModalBottomSheet();
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
          ),
        ],
      ),
    );
  }
}
