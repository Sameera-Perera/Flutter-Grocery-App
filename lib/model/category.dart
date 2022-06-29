import 'dart:convert';
import 'package:hive/hive.dart';

part 'category.g.dart';

List<Category> popularCategoryListFromJson(String val) =>
    List<Category>.from(json.decode(val)['data']
        .map((category) => Category.popularCategoryFromJson(category))
    );

List<Category> categoryListFromJson(String val) =>
    List<Category>.from(json.decode(val)['data']
        .map((category) => Category.categoryFromJson(category))
    );

@HiveType(typeId: 2)
class Category {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;

  Category({required this.id, required this.name, required this.image});

  factory Category.popularCategoryFromJson(Map<String, dynamic> data) =>
      Category(
          id: data['id'],
          name: data['attributes']['category']['data']['attributes']['name'],
          image: data['attributes']['category']['data']['attributes']['image']
              ['data']['attributes']['url']);

  factory Category.categoryFromJson(Map<String, dynamic> data) =>
      Category(
          id: data['id'],
          name: data['attributes']['name'],
          image: data['attributes']['image']['data']['attributes']['url']);
}
