import 'package:flutter/material.dart';
import 'package:flutter_routes_course/models/category.dart';
import '../utils/apps_routes.dart';
class CategoryItem extends StatelessWidget {

  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(
        AppRoutes.CATEGORIES_MEALS,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () => _selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Text(category.title),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
              colors:[
                category.color.withOpacity(0.5),
                category.color
              ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
        ),
      ),
    );
  }
}
