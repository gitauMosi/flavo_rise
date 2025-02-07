
import 'package:flavo_rise/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/meal_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryAsyncValue = ref.watch(categoryProvider);
    final mealAsyncValue = ref.watch(mealProvider("Beef"));
    
    return Scaffold(
      body: Center(
        child: mealAsyncValue.when(
          data: (meals){
            return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (contex, index){
                return ListTile(
                  title: Text(meals[index].strMeal ?? "Unknown"),
                );
              });
          },
          error: (error, stack) => Text("Something went wrong"), 
           loading: ()=> CircularProgressIndicator())
           
      ),
     );
  }
}