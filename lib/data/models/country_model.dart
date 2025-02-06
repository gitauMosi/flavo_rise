// To parse this JSON data, do
//
//     final countryData = countryDataFromJson(jsonString);

import 'dart:convert';

CountryData countryDataFromJson(String str) =>
    CountryData.fromJson(json.decode(str));

String countryDataToJson(CountryData data) => json.encode(data.toJson());

class CountryData {
  List<Country> meals;

  CountryData({
    required this.meals,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        meals:
            List<Country>.from(json["meals"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

class Country {
  String strArea;

  Country({
    required this.strArea,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        strArea: json["strArea"],
      );

  Map<String, dynamic> toJson() => {
        "strArea": strArea,
      };
}
