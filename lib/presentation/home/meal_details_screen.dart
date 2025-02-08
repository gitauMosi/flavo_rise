import 'package:flutter/material.dart';

import '../../data/models/meal.dart';

// ignore: must_be_immutable
class MealDetailsScreen extends StatelessWidget {
  Meal meal;
  MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _headerSection(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(meal.strMeal ?? "Unknown"),
                    Text('By Williams'),
                    
                      ],
                    ),
            
                    Wrap(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16,),
                        Text("4.6"),
                      ],
                    )
                  ],
                ),
            
                Text("Instructions", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(meal.strInstructions ?? "Empty")
                ],
            ),
          )
        ],
      ),
    );
  }

  Stack _headerSection(BuildContext context) {
    return Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  image: DecorationImage(
                      image: NetworkImage(meal.strMealThumb ??
                          "https://cdn.vectorstock.com/i/1000v/50/20/no-photo-or-blank-image-icon-loading-images-vector-37375020.jpg"),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              top: 20,
              right: 1,
              left: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).cardColor),
                        child: Center(
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).cardColor),
                      child: Center(
                        child: Icon(Icons.bookmark_outline),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
  }
}
