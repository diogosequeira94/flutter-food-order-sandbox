import 'package:flutter/material.dart';
import 'package:flutter_routes_course/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //I can get the arguments from Routes
    final category = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('Receitas ${category.title}',
        style: TextStyle(
          fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
