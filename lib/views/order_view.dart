import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    var cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Order"),
      ),
      body: Obx((){
        return SingleChildScrollView(
        child: Column(
          children: [
            //Upload Button
            FilledButton(onPressed: (){
              controller.pickImage();
            }, child: Text("Upload Payment Receipt")),
            // Receipt

            controller.image.value != null ? Image.file(controller.image.value!,height: 200,) : Text("Receipt Not Uplaod"),

            //Cart Items
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cartController.cartItems.value.data.length,
              itemBuilder: (BuildContext context,int index){
                var product = cartController.cartItems.value.data[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("${product.productImage}"),
                  ),
                  title: Text("${product.productName}"),
                 
                );
              }),

              ElevatedButton(onPressed: () async{
                Loader.show(context);
                await controller.placeOrder(controller.image.value!);
                Loader.hide();
              }, child: Text("Place Order"))
          ],
        ),
      );
      })
    );
  }
}