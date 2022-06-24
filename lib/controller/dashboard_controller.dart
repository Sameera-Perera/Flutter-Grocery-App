import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController instance = Get.find();
  var tabIndex = 0;

  void updateIndex(int index){
    tabIndex = index;
    update();
  }
}