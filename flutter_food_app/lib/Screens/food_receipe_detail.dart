
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/ModelClass/foodselected.dart';


class FoodReceipeDetail extends StatelessWidget{
final FoodSelected mealsDesc;
final Function delete;


FoodReceipeDetail({Key key, @required this.mealsDesc, this.delete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealsDesc.title),
        backgroundColor: Colors.pink,
      ),
      body: Column(
       children: [
         Container(
           child: Image.network(mealsDesc.imageUrl , height: 200, width: double.infinity, fit: BoxFit.cover,),
         ),
         Divider(
           color: Colors.black,
           thickness: 2.0,
         ),
         Container(
           margin: EdgeInsets.all(10),
           child: Text(
             'Ingredients',
             style: TextStyle(
               fontSize: 30,
               fontWeight:  FontWeight.bold
             ),
           ),
         ),
         Container(
           // color: Colors.yellow,
           height: MediaQuery.of(context).size.height * 0.15,
           width: double.infinity,
           child: ListView.builder(
               itemCount: mealsDesc.ingredients.length,
               itemBuilder: (context , index){
                 return Center(child: Text(mealsDesc.ingredients[index] , style: TextStyle(
                   fontSize:  18,
                 )));
           }),
         ),
         Divider(
           color: Colors.black,
           thickness: 2.0,
         ),
         Container(
           margin: EdgeInsets.all(10),
           child: Text(
             'Steps',
             style: TextStyle(
                 fontSize: 30,
                 fontWeight:  FontWeight.bold
             ),
           ),
         ),
         Container(
           padding: EdgeInsets.symmetric(
             vertical: 5,
             horizontal: 10
           ),
           // color: Colors.yellow,
           height: MediaQuery.of(context).size.height * 0.2,
           width: double.infinity,
           child: ListView.builder(
               itemCount: mealsDesc.steps.length,
               itemBuilder: (context , index){
                 return Text( '#${index+1}. ${mealsDesc.steps[index]}' , style: TextStyle(
                   fontSize:  18,
                 ),);
               }),
         ),
         Divider(
           color: Colors.black,
           thickness: 2.0,
         ),
       ],
      ),

    );
  }

}