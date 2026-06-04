import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/controller/category_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/controller/storage_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<StorageController>(StorageController(),permanent: true);
    Get.put<ProductController>(ProductController(),permanent: true);
    Get.put<CategoryController>(CategoryController(),permanent: true);
    Get.put<AuthController>(AuthController(),permanent: true);
  }

}