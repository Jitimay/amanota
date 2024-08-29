import 'package:flutter/material.dart';
import 'package:amanota/data/repositories/notes_database_helper.dart'; // Import the correct helper

class NotesPage extends StatefulWidget {
  final String subject;
  final int userId; // Add userId to identify user-specific notes
  final Function(String subject, String content) updateNotes;

  NotesPage({required this.subject, required this.userId, required this.updateNotes});

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final TextEditingController _notesController = TextEditingController();
  final NotesDatabaseHelper _dbHelper = NotesDatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future _loadNotes() async {
    List<Map<String, dynamic>> notes = await _dbHelper.getNotes(widget.subject, widget.userId); // Correctly pass userId
    if (notes.isNotEmpty) {
      setState(() {
        _notesController.text = notes.first['content'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.subject} Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _notesController,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Enter notes for ${widget.subject}',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await _dbHelper.insertNote(widget.subject, _notesController.text, widget.userId); // Insert user-specific notes
                widget.updateNotes(widget.subject, _notesController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Notes saved successfully')),
                );
              },
              child: Text('Save Notes'),
            ),
          ],
        ),
      ),
    );
  }
}
