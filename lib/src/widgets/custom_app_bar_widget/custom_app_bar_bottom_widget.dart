import 'package:flutter/material.dart';

class CustomAppBarBottomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarBottomWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(1.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.shade200,
        height: 1.0,
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
