import 'package:flavo_rise/data/models/meal.dart';
import 'package:flavo_rise/presentation/home/meal_details_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MealCardWidget extends StatelessWidget {
  Meal meal;
  MealCardWidget({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealDetailsScreen(meal: meal)));
      },
      child: Container(
        width: 120,
        margin: EdgeInsets.only(right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(meal.strMealThumb ??
                        "https://cdn.vectorstock.com/i/1000v/50/20/no-photo-or-blank-image-icon-loading-images-vector-37375020.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).cardColor,
              ),
            ),
            SizedBox(height: 6),
            Text(
              meal.strMeal ?? "Unknown",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
