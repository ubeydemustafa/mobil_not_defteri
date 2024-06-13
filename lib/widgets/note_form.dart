import 'package:flutter/material.dart';

class NoteForm extends StatefulWidget {
  final Function(String, String) onSubmit;
  final String initialTitle;
  final String initialBody;

  NoteForm({
    required this.onSubmit,
    this.initialTitle = '',
    this.initialBody = '',
  });

  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _body;

  @override
  void initState() {
    super.initState();
    _title = widget.initialTitle;
    _body = widget.initialBody;
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(_title, _body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: _title,
            decoration: InputDecoration(labelText: 'Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lütfen başlık giriniz';
              }
              return null;
            },
            onSaved: (value) {
              _title = value!;
            },
          ),
          TextFormField(
            initialValue: _body,
            decoration: InputDecoration(labelText: 'Body'),
            maxLines: 6,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lütfen notunuzu giriniz';
              }
              return null;
            },
            onSaved: (value) {
              _body = value!;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _saveForm,
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
