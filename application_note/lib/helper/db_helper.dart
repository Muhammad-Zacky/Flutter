import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:application_note/model/model_note.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;
  DatabaseHelper._instance();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'notes.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> queryAllNotes() async {
    final db = await database;
    return await db.query('notes');
  }

  Future<int> insertNote(ModelNote note) async {
    final db = await database;
    return await db.insert('notes', note.toMap());
  }

  Future<int> updateNote(ModelNote note) async {
    final db = await database;
    return await db.update('notes', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> insertDummyNotes() async {
    final db = await database;
    final existing = await db.query('notes');
    if (existing.isNotEmpty) return;

    List<ModelNote> notesToAdd = [
      ModelNote(title: "Ramadan List", content: "Tarawih, Reading Quran, Charity, Jogging"),
      ModelNote(title: "Finance History", content: "Here's a breakdown of..."),
      ModelNote(title: "My Journal", content: "The most important aspect in the meaning of life or aspect."),
      ModelNote(title: "Work List", content: "Design UI, DevOps, Figma, WebDev")
    ];

    for (final note in notesToAdd) {
      await insertNote(note);
    }
  }
} 
