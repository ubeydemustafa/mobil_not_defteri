import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/note_provider.dart';
import 'note_detail_screen.dart';
import 'note_edit_screen.dart';

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Defteri'),
      ),
      body: FutureBuilder(
        future: Provider.of<NoteProvider>(context, listen: false).fetchNotes(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('An error occurred!'));
          } else {
            return Consumer<NoteProvider>(
              builder: (ctx, noteProvider, child) => ListView.builder(
                itemCount: noteProvider.notes.length,
                itemBuilder: (ctx, i) => ListTile(
                  title: Text(noteProvider.notes[i].title),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      noteProvider.deleteNote(noteProvider.notes[i].id);
                    },
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => NoteDetailScreen(note: noteProvider.notes[i]),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NoteEditScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
