import 'package:flutter/material.dart';
import 'package:amanota/data/repositories/database_helper.dart';

class NotesPage extends StatefulWidget {
  final String subject;
  final Function(String subject, String content) updateNotes;

  NotesPage({required this.subject, required this.updateNotes});

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final TextEditingController _notesController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    List<Map<String, dynamic>> notes = await _dbHelper.getNotes(widget.subject);
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
                await _dbHelper.insertNote(widget.subject, _notesController.text);
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
