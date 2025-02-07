

import 'package:flavo_rise/providers/repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/meal.dart';

final mealProvider = FutureProvider.family<List<Meal>, String>((ref, category) async {
  return ref.read(mealRepoProvider).getMealsByCategory(category);
});
