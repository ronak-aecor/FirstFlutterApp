import 'package:flutter/material.dart';
import '../widgets/menu_bar.dart';
import 'tabs/favorite.dart';
import 'tabs/categories.dart';
import '../models/meal.dart';

class TabBars extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabBars(this.favoriteMeals);

  @override
  _TabBarsState createState() => _TabBarsState();
}

class _TabBarsState extends State<TabBars> {
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {
        'page': Categories(),
        'title': 'Categories',
      },
      {
        'page': FavoritePage(widget.favoriteMeals),
        'title': 'Favorite',
      },
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
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
      drawer: MenuBars(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Container(
        height: 100,
        child: BottomNavigationBar(
          onTap: _selectPage,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          backgroundColor: Colors.pink,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('categories'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text('favorite'),
            ),
          ],
        ),
      ),
    );
  }
}
