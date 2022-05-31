import 'package:get/get.dart';
import 'package:my_grocery/model/product.dart';
import 'package:my_grocery/service/remote_service/remote_product.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().get();
      if(result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }
}