import 'package:flutter/material.dart';

void navigationFadeTransitionHelp(
  BuildContext screenContext,
  String screenName,
  Widget Function() screen,
) {
  Navigator.of(screenContext).push(
    PageRouteBuilder(
      settings: RouteSettings(
        name: screenName,
      ),
      pageBuilder: (
        context,
        animation,
        secondaryAnimation,
      ) {
        return screen();
      },
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}
