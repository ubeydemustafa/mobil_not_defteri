import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/note_provider.dart';
import 'screens/note_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => NoteProvider(),
      child: MaterialApp(
        title: 'Not Defteri',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NoteListScreen(),
      ),
    );
  }
}
