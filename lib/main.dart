import 'package:flutter/material.dart';
import 'package:flutter_routes_course/screens/categories_item_base_screen.dart';
import 'package:flutter_routes_course/screens/meal_details_screen.dart';
import 'package:flutter_routes_course/screens/settings_screen.dart';
import 'package:flutter_routes_course/screens/tabs_screen.dart';
import 'models/settings_filters.dart';
import 'utils/apps_routes.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeals = DUMMY_MEALS;
  void _applyMealsSettingsFilter(Settings settings) {
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal){
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreen
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_applyMealsSettingsFilter),
      },
    );
  }
}