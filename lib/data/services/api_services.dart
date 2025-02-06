

import 'package:dio/dio.dart';
import 'package:flavo_rise/data/models/category.dart';
import 'package:flavo_rise/data/models/country_model.dart';
import 'package:flavo_rise/data/models/meal.dart';

class ApiServices {
  final baseUrl = "https://www.themealdb.com/api/json/v1/1";

  final dio = Dio();

  //serch meal by name
  Future<List<Meal>> searchMealsByName(String name) async {
    try {
      final response = await dio.get("$baseUrl/search.php?s=$name");
      if (response.statusCode == 200) {
        return MealData.fromJson(response.data).meals;
      } else {
        throw Exception("Failed to fetch meals by name");
      }
    } catch (e) {
      throw Exception("Failed to fetch meals by name");
    }
  }

  //List all meals by first letter
  Future<List<Meal>> fetchMealsByLetter(String letter) async {
    try {
      final response = await dio.get("$baseUrl/search.php?f=$letter");
      if (response.statusCode == 200) {
        return MealData.fromJson(response.data).meals;
      } else {
        throw Exception("Failed to fetch meals by letter");
      }
    } catch (e) {
      throw Exception("Failed to fetch meals by letter");
    }
  }

  //Lookup full meal details by id
  Future<MealData> fetchMealDetails(String mealId) async {
    try {
      final response = await dio.get("$baseUrl/lookup.php?i=$mealId");
      if (response.statusCode == 200) {
        return MealData.fromJson(response.data);
        
      } else {
        throw Exception("Failed to fetch meal details");
      }
    } catch (e) {
      throw Exception("Failde to fetch meal details");
    }
  }

  //List all meal categories
  Future<CategoryData> fetchCategoryData() async {
    try {
      final response = await dio.get("$baseUrl/categories.php");
      if (response.statusCode == 200) {
        return CategoryData.fromJson(response.data);
      } else {
        throw Exception("Failed to fetch category data");
      }
    } catch (e) {
      throw Exception("Failed to fetch category data");
    }
  }

  //List all Categories, 
  //www.themealdb.com/api/json/v1/1/list.php?c=list
  
  //list all Area, 
  //www.themealdb.com/api/json/v1/1/list.php?a=list
  Future<CountryData> fetchCountryData() async {
    try {
      final response = await dio.get("$baseUrl/list.php?a=list");
      if (response.statusCode == 200) {
        return CountryData.fromJson(response.data);
      } else {
        throw Exception("Failed to fetch country data");
      }
    } catch (e) {
      throw Exception("Failed to fetch country data");
    }
  }

  //list all Ingredients
  //www.themealdb.com/api/json/v1/1/list.php?i=list
  

  //Filter by main ingredient
  Future<List<Meal>> filterByIngredient(String ingredient) async {
    try {
      final response = await dio.get("$baseUrl/filter.php?i=$ingredient");
      if (response.statusCode == 200) {
        return MealData.fromJson(response.data).meals;
      } else {
        throw Exception("Failed to fetch meals by ingredient");
      }
    } catch (e) {
      throw Exception("Failed to fetch meals by ingredient");
    }
  }

  //Filter by Category
  Future<List<Meal>> filterByCategory(String category) async {
    try {
      final response = await dio.get("$baseUrl/filter.php?c=$category");
      if (response.statusCode == 200) {
        return MealData.fromJson(response.data).meals;
      } else {
        throw Exception("Failed to fetch meals by category");
      }
    } catch (e) {
      throw Exception("Failed to fetch meals by category");
    }
  }

  //Filter by Area
  Future filterByArea(String area) async {
    try {
      final response = await dio.get("$baseUrl/filter.php?a=$area");
      if (response.statusCode == 200) {
        return MealData.fromJson(response.data).meals;
      } else {
        throw Exception("Failed to fetch meals by area");
      }
    } catch (e) {
      throw Exception("Failed to fetch meals by area");
    }
  }
}
