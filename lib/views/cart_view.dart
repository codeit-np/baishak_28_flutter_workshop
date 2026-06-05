import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          height: 52,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            onPressed: () {
              Get.toNamed(AppRoutes.order);
            },
            child: Text("Proceed to Checkout"),
          ),
        ),
        appBar: AppBar(),
        body: Obx(() {
          if (controller.isLoading.value == true) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.cartItems.value.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var product = controller.cartItems.value.data[index];
                      return ListTile(
                        trailing: IconButton(onPressed: (){
                          Get.defaultDialog(
                            title: "Delete",
                            content: Text("Are you sure?"),
                            actions: [
                              TextButton(onPressed: (){
                                Get.back();
                              }, child: Text("Cancel")),
                              FilledButton(onPressed: (){}, child: Text("Yes")),
                            ]
                          );
                        }, icon: Icon(Icons.close,color: Colors.red,)),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "${product.productImage}",
                          ),
                        ),
                        title: Text("${product.productName}"),
                        subtitle: Row(
                          children: [
                            Text(
                              "(${product.quantity}) x ${product.sellingPrice} = ${product.totalAmt}",
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
