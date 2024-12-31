import 'package:flutter/material.dart';

import '../../models/note.dart';
import 'main_viewmodel.dart';
import '../view.dart';

class MainFloat extends StatelessWidget {
  const MainFloat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MainViewmodel>(
      builder: (context, vm, __) => FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          vm.createNote(
            Note(
              content: 'Add a note here',
              title: 'new note',
              id: null,
            ),
          );
        },
      ),
    );
  }
}
