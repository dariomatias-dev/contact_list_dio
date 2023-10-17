import 'dart:io';

import 'package:flutter/material.dart';

class ProfileIconWidget extends StatelessWidget {
  const ProfileIconWidget({
    super.key,
    required this.profilePicturePath,
  });

  final String? profilePicturePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
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
                    color: Colors.grey.shade800,
                    size: 40.0,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
