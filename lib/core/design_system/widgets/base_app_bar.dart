import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;

  const BaseAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
