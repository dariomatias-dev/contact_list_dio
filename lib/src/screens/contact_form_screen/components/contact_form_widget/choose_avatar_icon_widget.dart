import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:contact_list/src/screens/contact_form_screen/components/contact_form_widget/show_modal_bottom_sheet.dart';

import 'package:contact_list/src/widgets/profile_icon_widget.dart';

class ChooseAvatarIconWidget extends StatefulWidget {
  const ChooseAvatarIconWidget({
    super.key,
    required this.screenContext,
    required this.profilePicturePath,
    required this.updateProfilePicturePath,
  });

  final BuildContext screenContext;
  final String? profilePicturePath;
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
          final Directory imageDirectory =
              Directory('${directory.path}/imagens');
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
  void initState() {
    profilePicturePath = widget.profilePicturePath;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          ProfileIconWidget(
            profilePicturePath: profilePicturePath,
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
