import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal_detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetail(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);



    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = Dummy_Meals.firstWhere((meal) => meal.id == mealId);


    final ingrediant = selectedMeal.ingredients;
    final steps = selectedMeal.steps;


    Widget buildContainer(BuildContext context, info) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView.builder(
          itemBuilder: (ctx, index) => Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text('${(index + 1)}'),
                ),
                title: Text(info[index]),
              ),
              Divider(
                height: 8,
              ),
            ],
          ),
          itemCount: info.length,
        ),
      );
    }



    final PreferredSizeWidget appBars = AppBar(
      title: Text('${selectedMeal.title}'),
      actions: [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
        )
      ],
    );



    return Scaffold(
      appBar: appBars,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[

          Container(
            height: mediaQuery.size.height * 0.25,
            width: double.infinity,
              child : Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),


          ),

          buildSectionTitle(context, 'Ingredients'),
          buildContainer(context, ingrediant),


          Divider(
            color: Colors.black,
          ),
          buildSectionTitle(context, 'Steps for the receipe'),
          buildContainer(context, steps),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}

