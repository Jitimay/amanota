import 'package:amanota/presentation/ui/screens/add_page.dart';
import 'package:amanota/presentation/ui/widgets/home_content.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'settings_page.dart';
import 'view_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  Map<String, String> _notes = {
    'Geography': '',
    'History': '',
    'Maths': '',
  };

  void _updateNotes(String subject, String content) {
    setState(() {
      _notes[subject] = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeContent(updateNotes: _updateNotes),
      ViewPage(notes: _notes),
      AddPage(),
      SettingsPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, Jitimay'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/avatar.JPG'),
            ),
          ),
        ],
      ),
      body: _pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.view_list, size: 30, color: Colors.white),
          Icon(Icons.add, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
