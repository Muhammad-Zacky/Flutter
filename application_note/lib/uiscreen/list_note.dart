import 'package:flutter/material.dart';
import 'package:application_note/helper/db_helper.dart';
import 'package:application_note/model/model_note.dart';
import 'package:application_note/uiscreen/add_note.dart';
import 'package:application_note/uiscreen/edit_note.dart';
import 'package:intl/intl.dart'; 

class ListNoteView extends StatefulWidget {
  const ListNoteView({super.key});

  @override
  State<ListNoteView> createState() => _ListNoteViewState();
}

class _ListNoteViewState extends State<ListNoteView> {
  List<ModelNote> _notes = [];
  List<ModelNote> _filteredNotes = [];
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _fetchNotes();
  }

  Future<void> _fetchNotes() async {
    final noteMaps = await DatabaseHelper.instance.queryAllNotes();
    setState(() {
      _notes = noteMaps.map((map) => ModelNote.fromMap(map)).toList();
      _filteredNotes = _notes;
    });
  }

  void _searchNotes(String query) {
    setState(() {
      _filteredNotes = _notes
          .where((note) =>
              note.title.toLowerCase().contains(query.toLowerCase()) ||
              note.content.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search notes...',
                  border: InputBorder.none,
                ),
                onChanged: _searchNotes,
                autofocus: true,
              )
            : const Text('My Notes.', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  _filteredNotes = _notes;
                }
              });
            },
            icon: Icon(_isSearching ? Icons.close : Icons.search),
          ),
          if (!_isSearching)
            const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: CircleAvatar(radius: 16, backgroundColor: Colors.grey),
            ),
        ],
      ),
      body: _filteredNotes.isEmpty
          ? const Center(child: Text("Belum ada catatan."))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: _filteredNotes.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final note = _filteredNotes[index];
                  return GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditNoteView(note: note),
                        ),
                      );
                      if (result == true) {
                        _fetchNotes();
                      }
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Text(
                                note.content,
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                DateFormat('EEE, d MMM yyyy').format(DateTime.now()),
                                style: const TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddNoteView(),
            ),
          );
          if (result == true) {
            _fetchNotes();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}