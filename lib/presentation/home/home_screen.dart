
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/category.dart';
import '../../data/models/meal.dart';
import '../../providers/category_provider.dart';
import '../../providers/meal_provider.dart';
import '../../widgets/category_chip_widget.dart';
import '../../widgets/meal_card_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryAsyncValue = ref.watch(categoryProvider);
    final mealAsyncValue = ref.watch(mealProvider("Seafood"));

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            children: [
              _headerSection(),
              _searchSection(context),
              _customRow(context, "Categories", () {}),
              _categorySection(context, categoryAsyncValue),
              _customRow(context, "Recommendation", () {}),
              _recommendationSection(mealAsyncValue, context) ,
               _customRow(context, "Recipes Of The Week", () {}),
            ],
          ),
        ),
      ),
    ));
  }

  SizedBox _recommendationSection(
      AsyncValue<List<Meal>> mealAsyncValue, BuildContext context) {
    return SizedBox(
        height: 190,
        child: mealAsyncValue.when(
            data: (meals) {
              return ListView.builder(
                  itemCount: meals.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (contex, index) {
                    Meal meal = meals[index];
                    return MealCardWidget(meal: meal);
                  });
            },
            error: (error, stack) => Center(
                  child: Text("Something went wrong!"),
                ),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                )));
  }


  SizedBox _categorySection(
      BuildContext context, AsyncValue<List<Category>> categoryAsyncValue) {
    return SizedBox(
        height: 40,
        child: categoryAsyncValue.when(
            data: (categories) {
              return ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (mcontext, index) {
                    Category category = categories[index];
                    return CategoryChipWidget(category: category);
                  });
            },
            error: (error, index) => Center(
                  child: Text("Something went wrong!"),
                ),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                )));
  }

  Row _customRow(BuildContext context, String name, Function() function) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary),
        ),
        InkWell(
          onTap: function,
          child: Text(
            "See all",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        )
      ],
    );
  }

  Container _searchSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).cardColor),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
              hintText: 'Search recipes...',
              fillColor: Theme.of(context).cardColor,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  borderSide: BorderSide.none),
            ),
          )),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.tune),
            ),
          )
        ],
      ),
    );
  }

  Row _headerSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Anne',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.grey),
            ),
            Text(
              "What would you like\nto cook today?",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            )
          ],
        ),
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
                "https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png"),
          ),
        )
      ],
    );
  }
}
