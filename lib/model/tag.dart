class Tag {
  final int id;
  final String title;
  final double price;

  Tag({required this.id, required this.title, required this.price});

  factory Tag.fromJson(Map<String, dynamic> data) => Tag(
    id: data['id'],
    title: data['attributes']['title'],
    price: data['attributes']['price'].toDouble()
  );
}
