

import 'package:ecommerce/model/add_to_cart_model.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/services/cart_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  var isLoading = false.obs;
  var addToCartResponse = AddToCartModel(success: false, message: null).obs;
  var cartItems = CartModel(sucess: false, data: []).obs;

  Future addToCart(int productId,int qty) async{
    try{
      isLoading(true);
      var response = await CartService.addToCart(productId, qty);
       addToCartResponse.value = AddToCartModel.fromJson(response.data);
       if(addToCartResponse.value.success == true){
        Get.snackbar("Success", "Item added to Cart");
       }else{
        Get.snackbar("Failed", "Something went wrong");
       }
      
    }finally{
      isLoading(false);
    }
  } 

  Future getCartItems() async{
    try{
      isLoading(true);
      var response = await CartService.showCartItems();
      if(response != null){
        cartItems.value = CartModel.fromJson(response.data);
      }
    }finally{
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  

}