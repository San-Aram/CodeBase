import 'main_viewmodel.dart';
import '/screens/view.dart';
import 'package:flutter/material.dart';

import 'note_editor_tile.dart';
import 'note_tile.dart';

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectorView<MainViewmodel, int>(
      selector: (_, vm) => vm.listCount!,
      builder: (_, vm, __, ___) => ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 88),
        itemCount: vm.listCount!,
        itemBuilder: (context, index) =>
            vm.editIndex == index ? NoteEditorTile(index) : NoteTile(index),
      ),
    );
  }
}
