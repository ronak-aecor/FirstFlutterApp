import 'package:flutter/material.dart';
import 'package:flutter_food_app/ModelClass/foodselected.dart';

class Favorite extends StatelessWidget{
  final List<FoodSelected> meals = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images Fetched from Internet"),
      ),
      body: Container(
        width: double.infinity,
         child:  SingleChildScrollView(
          child: Column(

           children: [
             Image.network('https://picsum.photos/250?image=9'),
             Divider(),
             Image.network('https://picsum.photos/250?image=9'),
             Divider(),
             Image.network('https://picsum.photos/250?image=9'),
             Divider(),
           ],
         ),
       ),
    ),
    );
  }

}