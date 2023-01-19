import 'package:flutter/material.dart';
import 'package:flutter_bloc_rxdart_example/tabs/movies_tab.dart';
import 'blocs/movie.bloc.dart';

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
    moviesBloc.fetchAllMovies();
    return Scaffold(
      appBar: _navigationAppBar(
        _titlesTab[_selectedIndex],
        _colorsTab[_selectedIndex],
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar:
          _normalNavigationBar(_colorsTab, _selectedIndex, _onItemTapped),
    );
  }
}

AppBar _navigationAppBar(String title, Color color) {
  return AppBar(
    title: Text(title),
    backgroundColor: color,
  );
}

BottomNavigationBar _normalNavigationBar(List<Color> colorsTab,
    int selectedIndex, Function(int value) onItemTapped) {
  return BottomNavigationBar(
    items: _normalTabsBar(colorsTab),
    currentIndex: selectedIndex,
    selectedItemColor: Colors.white,
    onTap: onItemTapped,
  );
}

List<BottomNavigationBarItem> _normalTabsBar(List<Color> colorsTab) {
  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: const Icon(Icons.movie_filter),
        label: "Movies",
        backgroundColor: colorsTab[0]),
    BottomNavigationBarItem(
        icon: const Icon(Icons.newspaper),
        label: "Posts",
        backgroundColor: colorsTab[1]),
    BottomNavigationBarItem(
        icon: const Icon(Icons.people_sharp),
        label: "Users",
        backgroundColor: colorsTab[2]),
    BottomNavigationBarItem(
        icon: const Icon(Icons.comment),
        label: "Comments",
        backgroundColor: colorsTab[3]),
  ];
}
