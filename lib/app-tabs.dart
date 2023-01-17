import 'package:flutter/material.dart';
import 'package:flutter_bloc_rxdart_example/tabs/movies-tab.dart';

import 'blocs/movie-bloc.dart';

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

  static const _titlesTab = <String>[
    "Movies",
    "Posts",
    "Users",
    "Comments",
  ];

  static const _colorsTab = <Color>[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purple
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text(_titlesTab[_selectedIndex]),
        backgroundColor: _colorsTab[_selectedIndex],
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.movie_filter),
              label: "Movies",
              backgroundColor: _colorsTab[0]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.newspaper),
              label: "Posts",
              backgroundColor: _colorsTab[1]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.people_sharp),
              label: "Users",
              backgroundColor: _colorsTab[2]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.comment),
              label: "Comments",
              backgroundColor: _colorsTab[3]),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
