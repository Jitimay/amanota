import 'package:flutter/material.dart';

class School extends StatelessWidget {
  const School({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Schools',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: const [
            _SchoolItem(imagePath: 'images/LSE.png', schoolName: 'Saint-Esprit'),
            _SchoolItem(imagePath: 'images/image2.jpeg', schoolName: 'Lycee SOS'),
            _SchoolItem(imagePath: 'images/LLT.jpeg', schoolName: 'LLT'),
            _SchoolItem(imagePath: 'images/Vugizo.png', schoolName: 'Lycee Vugizo'),
          ],
        ),
      ],
    );
  }
}

class _SchoolItem extends StatelessWidget {
  final String imagePath;
  final String schoolName;

  const _SchoolItem({
    Key? key,
    required this.imagePath,
    required this.schoolName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            width: 80,
            height: 80,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          schoolName,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}