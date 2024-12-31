import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider for accessing ViewModel
import '../../models/note.dart';
import '/screens/main/main_viewmodel.dart';

class NoteEditorTile extends StatefulWidget {
  final int index;

  const NoteEditorTile(this.index, {Key? key}) : super(key: key);

  @override
  State<NoteEditorTile> createState() => _NoteEditorTileState();
}

class _NoteEditorTileState extends State<NoteEditorTile> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final vm =
        Provider.of<MainViewmodel>(context, listen: false); // Access ViewModel
    final note = vm.getNote(widget.index);
    _titleController.text = note.title;
    _contentController.text = note.content;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewmodel>(
      builder: (_, vm, __) {
        final note = vm.getNote(widget.index);

        return ListTile(
          title: TextField(
            controller: _titleController,
            decoration: const InputDecoration(hintText: 'Title'),
            onChanged: (value) {
              final updatedNote = Note(
                id: note.id,
                title: value,
                content: note.content,
              );
              vm.updateNote(index: widget.index, data: updatedNote);
            },
          ),
          subtitle: TextField(
            controller: _contentController,
            decoration: const InputDecoration(hintText: 'Content'),
            onChanged: (value) {
              final updatedNote = Note(
                id: note.id,
                title: note.title,
                content: value,
              );
              vm.updateNote(index: widget.index, data: updatedNote);
            },
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () => vm.editIndex = null,
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  vm.removeNote(note.id);
                  vm.editIndex = null;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
