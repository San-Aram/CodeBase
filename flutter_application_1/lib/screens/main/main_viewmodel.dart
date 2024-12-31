import '../../services/note/note_service.dart';

import '../../models/note.dart';

import '../../app/service_locator.dart';

import '../viewmodel.dart';

class MainViewmodel extends Viewmodel {
  List<Note>? _notes;
  final NoteService _noteService = locator<NoteService>();
  List<Note>? get notes => _notes;

  get noteService => _noteService;

  int? _editIndex;
  int? get editIndex => _editIndex;
  set editIndex(value) => update(() async => _editIndex = value);

  int? get listCount {
    return _notes?.length ?? 0;
  }

  Future<void> fetchNotes() async {
    _notes = await _noteService.fetchNotes();
    notifyListeners();
  }

  Future<void> createNote(Note note) async {
    update(() async {
      await _noteService.createNote(note);
      await fetchNotes();
    });
  }

  Future<void> updateNote({
    required int index,
    required Note data,
  }) async {
    await _noteService.updateNote(_notes![index].id, data);
    _notes![index] = Note(
      id: _notes![index].id,
      title: data.title,
      content: data.content,
    );
    notifyListeners();
  }

  Future<void> removeNote(String id) async {
    update(() async {
      await _noteService.removeNote(id);
      await fetchNotes();
    });
  }

  Note getNote(int index) => _notes![index];
}
