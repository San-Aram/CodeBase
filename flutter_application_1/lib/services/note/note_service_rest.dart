// NoteService implemented with RESTful service.

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/note.dart';
import 'note_service.dart';

class NoteServiceRest extends NoteService {
  final String baseUrl;

  NoteServiceRest(this.baseUrl);

  @override
  Future<List<Note>> fetchNotes() async {
    final response = await http.get(Uri.parse('$baseUrl/notes'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Note.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load notes');
    }
  }

  @override
  Future<void> createNote(Note note) async {
    final response = await http.post(
      Uri.parse('$baseUrl/notes'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(note.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create note');
    }
  }

  @override
  Future<void> updateNote(String noteId, Note updatedNote) async {
    final response = await http.put(
      Uri.parse('$baseUrl/notes/$noteId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedNote.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update note');
    }
  }

  @override
  Future<void> removeNote(String noteId) async {
    final response = await http.delete(Uri.parse('$baseUrl/notes/$noteId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete note');
    }
  }
}
