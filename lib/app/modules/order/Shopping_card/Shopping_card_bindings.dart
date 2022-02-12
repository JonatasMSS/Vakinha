import 'package:get/get.dart';
import './Shopping_card_controller.dart';

class ShoppingCardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ShoppingCardController(
        authServices: Get.find(), shoppingCardService: Get.find()));
  }
}
