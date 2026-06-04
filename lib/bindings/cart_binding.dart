import 'package:ecommerce/controller/cart_controller.dart';
import 'package:get/instance_manager.dart';

class CartBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<CartController>(CartController(),permanent: true);
  }
}