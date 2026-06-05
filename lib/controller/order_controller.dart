import 'dart:io';

import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/services/order_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OrderController extends GetxController{
  var isLoading = false.obs;
  final ImagePicker picker = ImagePicker();
  Rx<File?> image = Rx<File?>(null);

  //Image Picker
  Future pickImage() async{
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null){
      image.value = File(pickedFile.path);
    }
  }

  //Place Order
  Future placeOrder(File file) async{
    try{
      isLoading(true);
      var response = await OrderService.placeOrder(file);
      if(response.statusCode == 200){
        var cartController = Get.find<CartController>();
        await cartController.getCartItems();
       Get.offNamed(AppRoutes.orderComplete);
      }
    }finally{
      isLoading(false);
    }
  }
}