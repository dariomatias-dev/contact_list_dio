import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/show_modal_bottom_sheet.dart';

class ChooseAvatarIconWidget extends StatefulWidget {
  const ChooseAvatarIconWidget({
    super.key,
    required this.screenContext,
  });

  final BuildContext screenContext;

  @override
  State<ChooseAvatarIconWidget> createState() => _ChooseAvatarIconWidgetState();
}

class _ChooseAvatarIconWidgetState extends State<ChooseAvatarIconWidget> {
  final ImagePicker imagePicker = ImagePicker();
  File? imageFile;

  void deleteImageFile() {
    setState(() {
      imageFile = null;
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
        setState(() {
          imageFile = File(croppedFile.path);
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
                  backgroundImage:
                      imageFile != null ? FileImage(imageFile!) : null,
                  child: imageFile == null
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
