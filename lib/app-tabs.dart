import 'package:flutter/material.dart';
import 'package:flutter_bloc_rxdart_example/tabs/movies-tab.dart';

class AppTabs extends StatefulWidget {
  const AppTabs({super.key});

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MoviesTab(),
    Text('Index 1 Tab', style: optionStyle),
    Text('Index 2 Tab', style: optionStyle),
    Text('Index 3 Tab', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RxDart Example App")),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter),
              label: "Movies",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: "Posts",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_sharp),
              label: "Users",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.comment),
              label: "Comments",
              backgroundColor: Colors.purple),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
