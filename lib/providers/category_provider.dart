

import 'package:flavo_rise/providers/repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = FutureProvider((ref) async {
  return ref.read(mealRepoProvider).getCategories();
});