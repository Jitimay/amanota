import 'package:flutter/material.dart';

class HistoryNotesPage extends StatelessWidget {
  final TextEditingController _notesController = TextEditingController();
  final Function(String, String) updateNotes;

  HistoryNotesPage({required this.updateNotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Notes'),
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
                hintText: 'Enter notes for History',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                updateNotes('History', _notesController.text);
                Navigator.pop(context);
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
