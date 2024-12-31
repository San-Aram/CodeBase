import '../../models/note.dart';
import 'note_service.dart';

class NoteServiceMock extends NoteService {
  final List<Note> _noteList = [];

  @override
  Future<List<Note>> fetchNotes() async {
    return _noteList;
  }

  @override
  Future<void> createNote(Note note) async {
    note.id =
        (_noteList.length + DateTime.now().millisecondsSinceEpoch).toString();
    _noteList.add(note);
  }

  @override
  Future<void> updateNote(String noteId, Note updatedNote) async {
    final index = _noteList.indexWhere((note) => note.id == noteId);
    if (index != -1) {
      _noteList[index] = updatedNote;
    }
  }

  @override
  Future<void> removeNote(String noteId) async {
    _noteList.removeWhere((note) => note.id == noteId);
  }
}
