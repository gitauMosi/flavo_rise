
import 'package:flavo_rise/data/models/meal.dart';
import 'package:flavo_rise/data/services/api_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    List<Meal?>? mealdataList;
    bool isLoading = false;
  @override
  void initState() {
    
    super.initState();
    fetchCategoryData();
  }

  void fetchCategoryData() async {
   setState(() {
      isLoading = true;
   });
    mealdataList = await ApiServices().filterByIngredient("chicken_breast");
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading ?
         CircularProgressIndicator() 
         : SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(mealdataList!.length.toString() ?? "Unknown")
            ],
          ),
         )
      ),
     );
  }
}