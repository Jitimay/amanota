import 'package:flutter/material.dart';

class GeographyNotesPage extends StatelessWidget {
  final TextEditingController _notesController = TextEditingController();
  final Function(String, String) updateNotes;

  GeographyNotesPage({required this.updateNotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geography Notes'),
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
                hintText: 'Enter notes for Geography',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                updateNotes('Geography', _notesController.text);
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
