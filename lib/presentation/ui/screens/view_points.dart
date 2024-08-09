import 'package:flutter/material.dart';

class ViewPointsPage extends StatelessWidget {
  final String subject;
  final String notes;

  ViewPointsPage({required this.subject, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$subject Points'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notes for $subject:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              notes,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
