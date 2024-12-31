import '../../models/note.dart';

abstract class NoteService {
  Future<List<Note>> fetchNotes();
  Future<void> updateNote(String noteId, Note updatedNote);
  Future<void> removeNote(String noteId);
  Future<void> createNote(Note note);
}
