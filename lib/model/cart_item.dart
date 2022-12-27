import 'package:my_grocery/model/product.dart';
import 'package:my_grocery/model/tag.dart';

class CartItem{
  Product product;
  Tag tag;
  int quantity;

  CartItem({required this.product, required this.tag, required this.quantity});
}