
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FoodCategory {
 final String id;
 final  String foodTitle;
  final Color color;

 const FoodCategory({
   @required this.foodTitle,
    @required this.id,
    @required this.color
    }
  );
}