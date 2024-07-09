import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'hiSudoku',
      ),
      backgroundColor: const Color(0xff27187e),
      centerTitle: true,
      foregroundColor: const Color(0xfffae588),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          child: IconButton(
            icon: const Icon(Icons.notifications_rounded),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
