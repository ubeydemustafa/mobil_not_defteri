import 'package:flutter/material.dart';

import '../models/note.dart';
import 'note_edit_screen.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  NoteDetailScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NoteEditScreen(note: note),
                ),
              );
              (context as Element).reassemble(); // Ekranı yeniden çiz
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(note.body),
      ),
    );
  }
}
