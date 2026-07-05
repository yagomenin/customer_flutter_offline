import 'package:customer_flutter_offline/core/styles/colors_app.dart';
import 'package:customer_flutter_offline/core/styles/space.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({required this.title, this.actions, super.key});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        actions: actions,
        foregroundColor: ColorsApp.secondaryColor,
        title: Text(
          title,

          style: TextStyle(
            fontSize: Space.md * 1.2,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
