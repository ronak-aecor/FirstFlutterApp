import 'package:flutter/material.dart';
import 'data/dummy_data.dart';
import 'models/meal.dart';
import 'screens/drawer/filters.dart';
import 'screens/meal_detail.dart';
import 'screens/tabbars.dart';
import 'screens/category_meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = Dummy_Meals;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = Dummy_Meals.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          Dummy_Meals.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),

        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
              bodyText2: TextStyle(
                color: Colors.white,
              ),
              headline6: TextStyle(

                fontWeight: FontWeight.bold,
              ),
            ),
      ),

      initialRoute: '/', // default screen //
      routes: {
        '/': (ctx) => TabBars(_favoriteMeals),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetail.routeName: (ctx) =>
            MealDetail(_toggleFavorite, _isMealFavorite),
        FiltersPage.routeName: (ctx) => FiltersPage(_filters, _setFilters),
      },
    );
  }
}
