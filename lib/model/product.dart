import 'dart:convert';

List<Product> popularProductListFromJson(String val) =>
    List<Product>.from(json.decode(val)['data']
        .map((category) => Product.popularProductFromJson(category))
    );

class Product {
  final int id;
  final String name;
  final String description;
  final List<String> images;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.images});

  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      name: data['attributes']['product']['data']['attributes']['name'],
      description: data['attributes']['product']['data']['attributes']
          ['description'],
      images: List<String>.from(data['attributes']['product']['data']
              ['attributes']['images']['data']
          .map((image) => image['attributes']['url'])));
}
