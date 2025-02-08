import 'package:flavo_rise/data/models/category.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryChipWidget extends StatelessWidget {
  Category category;
  CategoryChipWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 8.0),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(category.strCategoryThumb),
                fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).cardColor),
        child: Center(
            child: Text(
          category.strCategory,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
              backgroundColor: Colors.black12),
        )));
  }
}
