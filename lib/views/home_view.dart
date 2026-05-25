import 'package:ecommerce/controller/category_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/views/product_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var productController = Get.find<ProductController>();
    var categoryController = Get.find<CategoryController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("eCommerce"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("Categories"),
              subtitle: Text("Choose your favourite category"),
            ),

            // Category List
              Obx((){
                if(categoryController.isLoading.value == true){
                  return LinearProgressIndicator();
                }else{
                  return SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryController.categories.value.data.length,
                      itemBuilder: (BuildContext context, int index){
                        var category = categoryController.categories.value.data[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: (){
                             
                            },
                            child: Chip(
                              label: Text("${category.title}")),
                          ),
                        );
                      }),
                  );
                }
              })
         ,
              // Products
              ListTile(
              title: Text("Products"),
              subtitle: Text("Choose your favourite Product"),
            ),

            Obx((){
              if(productController.isLoding.value == true){
                return LinearProgressIndicator();
              }else{
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context,int index){
                    var product = productController.products.value.data[index];
                    return GestureDetector(
                      onTap: () {
                        productController.fetchProduct(product.id);
                        Get.to(() => ProductView());
                      },
                      child: Card(
                        color: Colors.amber,
                        elevation: .2,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage("${product.image}"),
                          ),
                          title: Text("${product.title}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          subtitle: Row(
                            children: [
                             product.discountAmount == 0 ? SizedBox() : Text("Rs.${product.price}",style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.red),),
                            product.discountAmount == 0 ? SizedBox() :  Gap(10),
                              Text("Rs.${product.discountedPrice}",),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
              }
            })

          ],
        ),
      )
    );
  }
}