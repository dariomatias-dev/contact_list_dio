import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/show_modal_bottom_sheet.dart';

class ChooseAvatarIconWidget extends StatefulWidget {
  const ChooseAvatarIconWidget({
    super.key,
    required this.screenContext,
    required this.updateProfilePicturePath,
  });

  final BuildContext screenContext;
  final void Function(String?) updateProfilePicturePath;

  @override
  State<ChooseAvatarIconWidget> createState() => _ChooseAvatarIconWidgetState();
}

class _ChooseAvatarIconWidgetState extends State<ChooseAvatarIconWidget> {
  final ImagePicker imagePicker = ImagePicker();
  String? profilePicturePath;

  void deleteImageFile() {
    widget.updateProfilePicturePath(null);
    setState(() {
      profilePicturePath = null;
    });
  }

  Future<void> pick(ImageSource source) async {
    final XFile? pickedFile = await imagePicker.pickImage(
      source: source,
    );

    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(
          ratioX: 1,
          ratioY: 1,
        ),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Recortar',
            showCropGrid: false,
            activeControlsWidgetColor: Colors.blue,
          ),
          IOSUiSettings(
            title: 'Recortar',
          ),
        ],
      );

      if (croppedFile != null) {
        String imagePath = croppedFile.path;
        if (source == ImageSource.camera) {
          final Uint8List bytes = await croppedFile.readAsBytes();

          final Directory directory = await getApplicationDocumentsDirectory();
          final Directory imageDirectory = Directory('${directory.path}/imagens');
          imageDirectory.createSync();
          final String photoName = basename(croppedFile.path);
          imagePath = '${imageDirectory.path}/$photoName';
          final File imageFile = File(imagePath);
          await imageFile.writeAsBytes(bytes);
        }

        widget.updateProfilePicturePath(imagePath);
        setState(() {
          profilePicturePath = imagePath;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey.shade100,
                  backgroundImage: profilePicturePath != null
                      ? FileImage(
                          File(profilePicturePath!),
                        )
                      : null,
                  child: profilePicturePath == null
                      ? Icon(
                          Icons.person,
                          color: Colors.grey.shade500,
                          size: 40.0,
                        )
                      : null,
                ),
              ],
            ),
          ),
          Positioned(
            right: 9.0,
            bottom: 9.0,
            child: GestureDetector(
              onTap: () {
                showOptions(
                  widget.screenContext,
                  deleteImageFile,
                  pick,
                );
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
