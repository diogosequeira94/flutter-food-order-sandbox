import 'package:flutter/material.dart';
import '../utils/apps_routes.dart';

class MainDrawer extends StatelessWidget {

  Widget _createDrawerItem(BuildContext ctx, IconData icon, String label, String route){
    return ListTile(
      leading: Icon(
        icon,
        size: 22,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: () => Navigator.of(ctx).pushNamed(route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.bottomCenter,
            color: Theme.of(context).accentColor,
            child: Text('Lets Vegan Cook!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          _createDrawerItem(context, Icons.restaurant, 'Meals',
                  AppRoutes.HOME),
          Divider(),
          _createDrawerItem(context, Icons.settings, 'Settings',
              AppRoutes.SETTINGS),
        ],
      )
    );
  }
}
