import 'package:flutter/material.dart';
import 'package:meal_app/Screens/category_screen.dart';
import 'package:meal_app/Screens/favourites.dart';
import 'package:meal_app/Widgets/main_drawer.dart';
import 'package:meal_app/models/meals.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabScreen(this.favouriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': Favourites(widget.favouriteMeals),
        'title': 'Your Favourite',
      }
    ];
    super.initState();
  }

  void _selectedTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedTab,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favourites'),
            ),
          ]),
    );
  }
}
