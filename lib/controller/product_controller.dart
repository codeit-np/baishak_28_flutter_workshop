

import 'package:ecommerce/model/feature_product_model.dart';
import 'package:ecommerce/model/product_detail_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var a = 0.obs;
  var products = ProductModel(success: false, data: []).obs;
  var productDetail = ProductDetailModel(product: null).obs;
  var featuredProducts = FeaturedProductModel(success: false, data: []).obs;
  var isLoding = false.obs;

//Get Products
  Future fetchProducts() async {
    try {
      isLoding(true);
      var response = await ProductService.getProducts();
     
      if (response != null) {
       
        products.value = ProductModel.fromJson(response.data);
        
        
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoding(false);
    }
  }

  Future fetchProduct(int id) async {
    try {
      isLoding(true);
      var response = await ProductService.getProduct(id);
     
      if (response != null) {
       
        productDetail.value = ProductDetailModel.fromJson(response.data);
        
        
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoding(false);
    }
  }

  //get Featured Products
  Future getFeaturedProducts() async{
    try{
      isLoding(true);
      var response = await ProductService.getFeaturedProducts();
      if(response != null){
        featuredProducts.value = FeaturedProductModel.fromJson(response.data);
      }
    }finally{
      isLoding(false);
    }
  }



  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    getFeaturedProducts();
  }
}
