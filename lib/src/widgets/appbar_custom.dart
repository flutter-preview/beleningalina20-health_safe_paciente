import 'package:flutter/material.dart';

class AppbarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.chat_bubble_outline_sharp),
            onPressed: () {
              // TODO Navegar a la casilla de mensajes
            })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
