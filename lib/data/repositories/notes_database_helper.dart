import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDatabaseHelper {
  static final NotesDatabaseHelper _instance = NotesDatabaseHelper._internal();
  factory NotesDatabaseHelper() => _instance;
  static Database? _database;

  NotesDatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'notes.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        subject TEXT,
        content TEXT,
        userId INTEGER
      )
    ''');
  }

  Future<void> insertNote(String subject, String content, int userId) async {
    final db = await database;
    await db.insert(
      'notes',
      {'subject': subject, 'content': content, 'userId': userId},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getNotes(String subject, int userId) async {
    final db = await database;
    return db.query(
      'notes',
      where: 'subject = ? AND userId = ?',
      whereArgs: [subject, userId],
    );
  }
}
