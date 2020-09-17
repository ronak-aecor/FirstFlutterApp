import 'package:flutter_food_app/Daily_Meals/models/meal.dart';
import 'package:flutter_food_app/Daily_Meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritePage(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text(
            'You have no favorites yet - start adding some!',
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
