import 'package:flutter/material.dart';

import '../view.dart';
import 'main_viewmodel.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade400,
      title: const Text('My Notes',
          style: TextStyle(color: Color.fromARGB(255, 248, 247, 247))),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 17),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: SelectorView<MainViewmodel, int>(
              selector: (_, vm) => vm.listCount!,
              builder: (_, __, count, ___) => Text(
                '$count',
                style: const TextStyle(
                  color: Color.fromARGB(255, 248, 247, 247),
                  fontSize: 21,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
