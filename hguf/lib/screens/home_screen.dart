import 'package:flutter/material.dart';
import 'package:ionic/screens/student_screen.dart';

final HOME_SCREEN = '/home_screen';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Widget> _widgetOptions = <Widget>[
    StudentScreen(),
    Container(
      color: Colors.blue[100],
    ),
    Container(
      color: Colors.red,
    ),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
              ),
              title: Text("Estudante")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
              ),
              title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
              ),
              title: Text("Home")),
        ],
      ),
    );
  }
}
