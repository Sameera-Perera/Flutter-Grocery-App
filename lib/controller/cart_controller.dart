import 'package:get/get.dart';
import 'package:my_grocery/model/tag.dart';
import 'package:my_grocery/service/remote_service/remote_cart_service.dart';

import '../model/cart_item.dart';
import '../model/product.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxList<CartItem> cartItemList = List<CartItem>.empty(growable: true).obs;
  RxBool isCartLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  void addCart({
    required Product product,
    required Tag tag,
    required int quantity,
    required String token,
  }) async {
    try {
      RemoteCartService().create(
          productId: product.id,
          tagId: tag.id,
          quantity: quantity,
          token: token
      );
      CartItem? item = cartItemList.firstWhereOrNull(
          (item) => item.product.id == product.id && item.tag.id == tag.id);
      if (item != null) {
        CartItem newItem = CartItem(
          quantity: (quantity + item.quantity),
          product: product,
          tag: tag,
        );
        cartItemList[cartItemList.indexWhere((element) =>
            item.product.id == product.id && item.tag.id == tag.id)] = newItem;
      } else {
        cartItemList
            .add(CartItem(quantity: quantity, product: product, tag: tag));
      }
      RemoteCartService().create(
          productId: product.id,
          tagId: tag.id,
          quantity: quantity,
          token: token);
    } finally {}
  }

  double getCartTotal() {
    double total = 0;
    try {
      for (var item in cartItemList) {
        total = total + (item.quantity * item.tag.price);
      }
    } finally {}
    return total;
  }

  void removeCart({required int index, required int itemId, required String token}) {
    try {
      cartItemList.removeAt(index);
      RemoteCartService().delete(itemId: itemId, token: token);
    } finally {}
  }
}
