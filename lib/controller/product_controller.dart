

import 'package:ecommerce/model/product_detail_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var a = 0.obs;
  var products = ProductModel(success: false, data: []).obs;
  var productDetail = ProductDetailModel(product: null).obs;
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



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }
}
