import 'package:flutter/material.dart';
import 'main_viewmodel.dart';
import '../view.dart';

class NoteTile extends StatefulWidget {
  final int index;

  const NoteTile(this.index, {Key? key}) : super(key: key);

  @override
  State<NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  bool _showDeleteButton = false;

  void _toggleDeleteButton() {
    setState(() {
      _showDeleteButton = !_showDeleteButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MainViewmodel>(
      builder: (_, vm, __) {
        final note = vm.getNote(widget.index);
        return GestureDetector(
          onLongPress: _toggleDeleteButton,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
            child: ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                note.content,
                style: const TextStyle(color: Colors.black87),
              ),
              onTap: () => vm.editIndex = widget.index,
              trailing: _showDeleteButton
                  ? IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 63, 61, 61),
                      ),
                      onPressed: () => vm.removeNote(note.id),
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}
