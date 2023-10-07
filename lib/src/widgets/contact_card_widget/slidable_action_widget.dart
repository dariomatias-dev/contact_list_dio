import 'package:flutter/material.dart';

class SlidableActionWidget extends StatelessWidget {
  const SlidableActionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.action,
    required this.backgroundColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback action;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}