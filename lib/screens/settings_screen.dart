import 'package:flutter/material.dart';
import 'package:flutter_routes_course/components/main_drawer.dart';
import '../models/settings_filters.dart';

class SettingsScreen extends StatefulWidget {

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  var settings = Settings();

  Widget _createSwitch(String title,
      String subtitle,
      bool value,
      Function onChanged){
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Settings',
            style: TextStyle(
              fontSize: 20.0
              ),
            ),
          ),
          Expanded(
              child: ListView(
                children: <Widget>[
                  _createSwitch(
                      'Gluten Free',
                      'Only Gluten Free Meals',
                      settings.isGlutenFree,
                      (value) => setState(() => settings.isGlutenFree = value),
                  ),
                  _createSwitch(
                    'Lactose Free',
                    'Only Lactose Free Meals',
                    settings.isLactoseFree,
                        (value) => setState(() => settings.isLactoseFree = value),
                  ),
                  _createSwitch(
                    'Vegan Meals',
                    'Only Vegan Meals',
                    settings.isVegan,
                        (value) => setState(() => settings.isVegan = value),
                  ),
                  _createSwitch(
                    'Vegetarian Meals',
                    'Only Vegetarian Meals',
                    settings.isVegetarian,
                        (value) => setState(() => settings.isVegetarian = value),
                  ),
                ],
              ),
          ),
        ],
      )
        );
  }
}
