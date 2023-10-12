import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showOptions(
  BuildContext screenContext,
  VoidCallback deleteImageFile,
  Future<void> Function(ImageSource) pick,
) {
  showModalBottomSheet(
    context: screenContext,
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
            onTap: () {
              pick(ImageSource.gallery);
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.photo,
            ),
            title: const Text('Galeria'),
          ),
          ListTile(
            onTap: () {
              pick(ImageSource.camera);
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.camera_alt_rounded,
            ),
            title: const Text('Câmera'),
          ),
          ListTile(
            onTap: () {
              deleteImageFile();
              Navigator.pop(context);
            },
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
