import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/ModelClass/food_category.dart';
import 'package:flutter_food_app/ModelClass/foodselected.dart';
import 'package:flutter_food_app/database/dummy_data.dart';

import 'food_receipe_detail.dart';


class FoodSelectedItem extends StatelessWidget {
  final FoodCategory cat;
  final Function removeItem;

  //complex is used to retrieve the value of Complexity from the array
  FoodSelectedItem({Key key, @required this.cat, this.removeItem}) : super(key: key);

  var complex;

  String get complexText {
    switch (complex) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;

      default:
        return "Unknown";
    }
  }

  var afford;

  String get affordText{
    switch(afford){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
         return 'Luxurious';
         break;
      case Affordability.Pricey:
          return 'Pricey';
          break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(cat.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(cat.foodTitle),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            final item = categoryMeals[index];
            complex = item.complexity;
            afford = item.affordability;
            return InkWell(
                child: Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  elevation: 4,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                            child: Image.network(
                              item.imageUrl,
                              // height: 250,
                              // width: double.infinity,
                              // fit: BoxFit.cover,
                            ),
                          ),
                          //Used to set the position of the widget.
                          Positioned(
                            bottom: 20,
                            right: 10,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              color: Colors.black54,
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              child: Text(
                                item.title,
                                style: TextStyle(
                                    fontSize: 26, color: Colors.white),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.schedule),
                                SizedBox(
                                  width: 4,
                                ),
                                Text("${item.duration}"),
                              ],
                            ),

                            Row(
                              children: [
                                Icon(Icons.work),
                                SizedBox(
                                  width: 4,
                                ),
                                Text("${complexText}")
                              ],
                            ),

                            Row(
                              children: [
                                Icon(Icons.attach_money),
                                SizedBox(
                                  width: 4,
                                ),
                                Text("${affordText}")
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodReceipeDetail(
                              mealsDesc: categoryMeals[index],
                            )),
                  );
                });
          }),
    );
  }
}

