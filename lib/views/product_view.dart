import 'package:ecommerce/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var productController = Get.find<ProductController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Obx((){
        if(productController.isLoding.value == true){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return SingleChildScrollView(
            child: Column(
              children: [
                AspectRatio(aspectRatio: 16/9,child:  Image.network("${productController.productDetail.value.product!.image}"),),
                Text("${productController.productDetail.value.product!.title}"),

               Html(data: "${productController.productDetail.value.product!.description}")
              ],
            ),
          );
        }
      })
    );
  }
}