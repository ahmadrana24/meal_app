import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/meal_item.dart';
import 'package:meal_app/models/meals.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favouriteMeals;
  const Favourites(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Container(
        child: Text('You have no Favourite Item Right Now :)'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
            duration: favouriteMeals[index].duration,
            imageUrl: favouriteMeals[index].imageUrl,
            title: favouriteMeals[index].title,
            // removeItem: _removeMeal,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
