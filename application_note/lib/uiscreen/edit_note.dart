import 'package:flutter/material.dart';
import 'package:application_note/helper/db_helper.dart';
import 'package:application_note/model/model_note.dart';

class EditNoteView extends StatefulWidget {
  final ModelNote note;
  const EditNoteView({super.key, required this.note});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  void _updateNote() async {
    final updatedNote = ModelNote(
      id: widget.note.id,
      title: _titleController.text,
      content: _contentController.text,
    );
    await DatabaseHelper.instance.updateNote(updatedNote);
    Navigator.pop(context, true);
  }

  void _deleteNote() async {
    await DatabaseHelper.instance.deleteNote(widget.note.id!);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Catatan')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Judul')),
            SizedBox(height: 8),
            TextField(controller: _contentController, decoration: InputDecoration(labelText: 'Isi'),
            maxLines: 8),
            Row(
              children: [
                ElevatedButton(onPressed: _updateNote, child: Text('Update')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: _deleteNote, child: Text('Hapus')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
