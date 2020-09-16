import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_app/database/dummy_data.dart';

import '../food_item_selected.dart';

class CategoriesList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Food Listings"),
     ),
     body: Container(
       padding: EdgeInsets.all(16),
       child: GridView.builder(
         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
           maxCrossAxisExtent: 200,
           childAspectRatio: 3 / 2 ,
           crossAxisSpacing: 20,
           mainAxisSpacing: 20,
         ),
         itemCount: DUMMY_CATEGORIES.length,
         itemBuilder: (context ,index){
         return InkWell(
           child: Container(
             padding: EdgeInsets.all(20),
             decoration: BoxDecoration(
               gradient: LinearGradient(
                 colors: [
                   DUMMY_CATEGORIES[index].color.withOpacity(0.7),
                   DUMMY_CATEGORIES[index].color,
                 ],
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
               ),
               borderRadius: BorderRadius.circular(15)
             ),
             child: Center(
                 child: Text(DUMMY_CATEGORIES[index].foodTitle)
             ),

           ),
           onTap: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => FoodSelectedItem(cat: DUMMY_CATEGORIES[index],))
             );
           },
         );
         },
       ),
     ),
   );
  }
}




