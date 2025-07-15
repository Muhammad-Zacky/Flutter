import 'package:flutter/material.dart';
import 'package:application_note/helper/db_helper.dart';
import 'package:application_note/model/model_note.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _saveNote() async {
    if (_titleController.text.isNotEmpty) {
      final note = ModelNote(
        title: _titleController.text,
        content: _contentController.text,
      );
      await DatabaseHelper.instance.insertNote(note);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Catatan')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Judul')),
            SizedBox(height: 8),
            TextField(controller: _contentController, decoration: InputDecoration(labelText: 'Isi'),
            maxLines: 8),

            ElevatedButton(onPressed: _saveNote, child: Text('Simpan')),
          ],
        ),
      ),
    );
  }
}
