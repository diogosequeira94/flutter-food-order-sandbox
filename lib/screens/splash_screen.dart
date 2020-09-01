import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_routes_course/screens/tabs_screen.dart';

class SplashScreen extends StatefulWidget {



  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => (TabsScreen()))));

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Text('Lets Vegan Cook!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
