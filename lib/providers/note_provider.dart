import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/note.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [
    // Örnek notlar
    Note(
      id: 1,
      title: "Örnek Not 1",
      body: "Bu örnek bir nottur.",
    ),
    Note(
      id: 2,
      title: "Örnek Not 2",
      body: "Bu başka bir örnek nottur.",
    ),
  ];

  List<Note> get notes => _notes;

  Future<void> fetchNotes() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      _notes = jsonResponse.map((note) => Note.fromJson(note)).toList();
      notifyListeners();
    } else {
      throw Exception('Notlar yüklenemedi.');
    }
  }

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(Note note) {
    final index = _notes.indexWhere((element) => element.id == note.id);
    if (index != -1) {
      _notes[index] = note;
      notifyListeners();
    }
  }

  void deleteNote(int id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }
}
