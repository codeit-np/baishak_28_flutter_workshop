import 'package:ecommerce/controller/storage_controller.dart';
import 'package:ecommerce/utils/api_connect.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class CartService {
  // Add to cart
  static Future addToCart(int productId, int qty) async{
    // get token
    var storageController = Get.find<StorageController>();
    var token = storageController.getToken();

    // Add token to dio header
    ApiConnect.dio.options.headers['Authorization'] = "Bearer $token";
    var response = await ApiConnect.dio.post("cart",queryParameters: {"product_id": productId,"qty": qty});
    return response;

  }

  // Show Cart item
  static Future showCartItems() async{
     // get token
    var storageController = Get.find<StorageController>();
    var token = storageController.getToken();

    // Add token to dio header
    ApiConnect.dio.options.headers['Authorization'] = "Bearer $token";
    
    var response = await ApiConnect.dio.get("carts");
    return response;

  }

  // Delete Cart Item
}