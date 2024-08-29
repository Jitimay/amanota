  import 'package:amanota/data/data_sources/notes_page.dart';
  import 'package:amanota/presentation/ui/widgets/category_chip.dart';
  import 'package:amanota/presentation/ui/widgets/school.dart';
  import 'package:flutter/material.dart';

  class HomeContent extends StatelessWidget {
    final Function(String subject, String content) updateNotes;
    final int userId; // Hardcode or pass the userId from the parent widget

    HomeContent({required this.updateNotes, required this.userId});

    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Class',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryChip(label: 'Maths-Physics', isSelected: true),
                  CategoryChip(label: 'Bio-Chemistry'),
                  CategoryChip(label: 'Economics'),
                  CategoryChip(label: 'Art'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildSubjectCard(context, 'Maths', 'images/image1.jpeg', 'Maths'),
                  SizedBox(width: 8),
                  _buildSubjectCard(context, 'Geography', 'images/image3.png', 'Geography'),
                  SizedBox(width: 8),
                  _buildSubjectCard(context, 'History', 'images/image2.jpeg', 'History'),
                  SizedBox(width: 8),
                  _buildSubjectCard(context, 'Biology', 'images/image4.jpeg', 'Biology'),
                  SizedBox(width: 8),
                  _buildSubjectCard(context, 'Chemistry', 'images/image5.jpeg', 'Chemistry'),
                  SizedBox(width: 8),
                  _buildSubjectCard(context, 'Leadership', 'images/image6.jpeg', 'Leadership'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Live Workshops',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Art Direction & Design Leadership'),
              subtitle: Text('15 November, 16:00-16:30'),
            ),
            ListTile(
              title: Text('How to Become a UX Designer'),
              subtitle: Text('16 November, 18:00-18:40'),
            ),
            SizedBox(height: 16),
            const School(),
          ],
        ),
      );
    }

    Widget _buildSubjectCard(BuildContext context, String subject, String imagePath, String subjectKey) {
      return GestureDetector(
        onTap: () {
          // Navigate to the NotesPage with the hardcoded userId
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotesPage(
                subject: subjectKey,
                userId: userId, // Pass the hardcoded userId
                updateNotes: updateNotes,
              ),
            ),
          );
        },
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              subject,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
  }
