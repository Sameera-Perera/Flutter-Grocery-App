import 'package:hive/hive.dart';

import '../../model/category.dart';

class LocalCategoryService {
  late Box<Category> _popularCategoryBox;

  Future<void> init() async {
    _popularCategoryBox = await Hive.openBox<Category>('PopularCategories');
  }

  Future<void> assignAllPopularCategories({required List<Category> popularCategories}) async {
    await _popularCategoryBox.clear();
    await _popularCategoryBox.addAll(popularCategories);
  }

  List<Category> getPopularCategories() => _popularCategoryBox.values.toList();
}