
import 'dart:convert';
import 'package:flavo_rise/data/models/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flavo_rise/data/services/api_services.dart';
import '../../data/models/category.dart';

class MealRepository {
  final ApiServices apiServices;
  MealRepository(this.apiServices);

  Future<List<Category>> getCategories() async {
    final prefs = await SharedPreferences.getInstance();

    // Check if cached data exists
    final cachedData = prefs.getString('categories');
    if (cachedData != null) {
      final List<dynamic> jsonData = json.decode(cachedData);
      return jsonData.map((item) => Category.fromJson(item)).toList();
    }

    try {
      // Fetch from API if cache is empty
      final List<Category> categories = await apiServices.fetchCategoryData();

      // Store in cache
      await prefs.setString('categories', json.encode(categories.map((e) => e.toJson()).toList()));

      return categories;
    } catch (e) {
      return [];
    }
  }


  Future<List<Meal>> getMealsByCategory(String category) async {
    try {
      return await apiServices.filterByCategory(category);
    } catch (e) {
      return [];
    }
  }
}
