import 'package:flutter/material.dart';

import 'package:contact_list/src/widgets/custom_app_bar_widget/custom_app_bar_bottom_widget.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    this.showExitButton = true,
    this.title,
    this.centerTitle = false,
    this.actions,
  });

  final bool showExitButton;
  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 56.0,
      backgroundColor: Colors.white,
      leading: showExitButton
          ? Tooltip(
              message: 'Sair',
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                color: Colors.black,
              ),
            )
          : null,
      centerTitle: centerTitle,
      actions: actions,
      bottom: const CustomAppBarBottomWidget(),
    );
  }
}
