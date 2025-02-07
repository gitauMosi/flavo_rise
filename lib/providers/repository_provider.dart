

import 'package:flavo_rise/data/services/api_services.dart';
import 'package:flavo_rise/domain/repositories/meal_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServicesProvider = Provider<ApiServices>((ref) => ApiServices());


final mealRepoProvider = Provider<MealRepository>((ref) {
  return MealRepository(ref.read(apiServicesProvider));
});