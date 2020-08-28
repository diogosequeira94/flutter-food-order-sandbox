import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/cateogory_item.dart';
import '../data/dummy_data.dart';


class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lets Cook Bros'),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(25.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((cat){
          return CategoryItem(cat);
        }).toList(),
      ),
    );
  }
}
