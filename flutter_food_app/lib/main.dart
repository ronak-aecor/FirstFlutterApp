import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ModelClass/foodselected.dart';
import 'Screens/Tabs/categories_list.dart';
import 'Screens/Tabs/favorites.dart';
import 'database/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<FoodSelected> favMeals = [];

  void _toggleFav(String mealId){
    final existingIndex = favMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        favMeals.removeAt(existingIndex);
      });
    } else{
      setState(() {
        favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: _addTabBar() ,
          bottomNavigationBar: _bottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _addTabBar(){
    return TabBarView(
      children: [
        CategoriesList(),
        Favorite()
      ],
    );
  }

  Widget _bottomNavigationBar(){
    return Container(
      height: 80,
      color: Colors.pink,
      child: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.home,),
            child: Text("Categories"),
          ),
          Tab(
            icon: Icon(Icons.star ),
            child: Text("Favorites"),
          ),
        ],
        labelColor: Colors.yellow,
        unselectedLabelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.greenAccent,
      ),
    );
  }
}

