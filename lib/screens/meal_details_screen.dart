import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  
  Widget _createSectionTitle(BuildContext context, String title){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
          title, 
          style: TextStyle(fontSize: 18.0)
      ),
    );
  }
  
  Widget _createSectionContainer(Widget child) {
    return Container(
      height: 250,
      width: 330,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            _createSectionTitle(context, 'Ingredients'),
            _createSectionContainer(
                ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10.0,
                          ),
                          child: Text(meal.ingredients[index]),
                        ),
                      );
                    })
            ),
            _createSectionTitle(context, 'Steps'),
            _createSectionContainer(
              ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider(),
                      ],
                    );
                  }
              )
            )
          ],
        ),
      ),
    );
  }
}
