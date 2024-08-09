import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  final Map<String, String> notes;

  ViewPage({required this.notes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Notes'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildNoteSection('Geography', notes['Geography'] ?? 'No notes yet'),
          _buildNoteSection('History', notes['History'] ?? 'No notes yet'),
          _buildNoteSection('Maths', notes['Maths'] ?? 'No notes yet'),
          _buildNoteSection('Biology', notes['Biology'] ?? 'No notes yet'),
          _buildNoteSection('Chemistry', notes['Chemistry'] ?? 'No notes yet'),
          _buildNoteSection('Leadership', notes['Leadership'] ?? 'No notes yet'),
        ],
      ),
    );
  }

  Widget _buildNoteSection(String subject, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subject,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(content),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
