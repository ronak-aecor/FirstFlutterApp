import 'package:flutter/material.dart';
import '../../widgets/item.dart';
import '../../data/dummy_data.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Daily Meals'),
      // ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        children: Dummy_Data.map(
          (catData) => CategoryItem(
            catData.id,
            catData.title,
            catData.color,
          ),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
          childAspectRatio: MediaQuery.of(context).size.height * 0.0015,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
