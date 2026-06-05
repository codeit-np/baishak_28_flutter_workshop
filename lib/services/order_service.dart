import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/storage_controller.dart';
import 'package:ecommerce/utils/api_connect.dart';
import 'package:get/instance_manager.dart';

class OrderService {
  static Future placeOrder(File file) async{
    var token = StorageController().getToken();

    final cartController = Get.find<CartController>();

    var items = cartController.cartItems.value.data.map((e) => {
      "product_id" : e.productId,
      "qty" : e.quantity
    }).toList();

    FormData formData = FormData.fromMap({
      "payment_receipt" : await MultipartFile.fromFile(
        file.path,
        filename: file.path.split("/").last
      ),
      "items": items
    });

    ApiConnect.dio.options.headers["Authorization"] = "Bearer $token";

    var response = await ApiConnect.dio.post("order",data: formData);
    return response;
  }
}