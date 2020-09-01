import 'package:flutter/material.dart';
import 'package:flutter_routes_course/components/main_drawer.dart';
import 'package:flutter_routes_course/screens/favourites_screen.dart';
import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreenIndex = 0;

  final List<Map<String, Object>> _screens = [
    {'title': 'Categories List', 'screen': CategoriesScreen()},
    {'title': 'My Favourites', 'screen': FavouriteScreen()},
  ];

  void _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_screens[_selectedScreenIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedScreenIndex,
          items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          title: Text('Categories'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          title: Text('Favourites'),
        )
      ]),
    );
  }
}
