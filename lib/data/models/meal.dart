

class MealData {
  List<Meal> meals;

  MealData({required this.meals});

  factory MealData.fromJson(Map<String, dynamic> json) {
    return MealData(
      meals: List<Meal>.from(json['meals'].map((meal) => Meal.fromJson(meal))),
    );
  }
}

class Meal {
  String? idMeal;
  String? strMeal;
  String? strDrinkAlternate;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;
  List<String?> ingredients;
  List<String?> measures;
  String? strSource;
  String? strImageSource;
  String? strCreativeCommonsConfirmed;
  String? dateModified;

  Meal({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    required this.ingredients,
    required this.measures,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strDrinkAlternate: json['strDrinkAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      ingredients: List.generate(20, (index) => json['strIngredient${index + 1}']),
      measures: List.generate(20, (index) => json['strMeasure${index + 1}']),
      strSource: json['strSource'],
      strImageSource: json['strImageSource'],
      strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: json['dateModified'],
    );
  }
}

