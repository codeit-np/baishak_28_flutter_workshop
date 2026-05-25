import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/category_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/views/product_by_category_view.dart';
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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "ShopSphere",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories Header
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Choose your favourite category",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),

            // Featured Carousel
            Obx(() {
              if (productController.isLoding.value) {
                return const LinearProgressIndicator();
              }
              return CarouselSlider(
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.85,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 4),
                ),
                items: productController.featuredProducts.value.data.map((i) {
                  return Builder(
                    builder: (context) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "${i.image}",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }),

            const Gap(24),

            // Categories Horizontal Scroll
            Obx(() {
              if (categoryController.isLoading.value) {
                return const LinearProgressIndicator();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Browse Categories",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Gap(12),
                  SizedBox(
                    height: 55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: categoryController.categories.value.data.length,
                      itemBuilder: (context, index) {
                        var category = categoryController.categories.value.data[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            onTap: () {
                              categoryController.getProductByCategory(category.id!);
                              Get.to(() => ProductByCategoryView());
                            },
                            child: Chip(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(color: Colors.deepPurple, width: 1.2),
                              ),
                              label: Text(
                                "${category.title}",
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),

            const Gap(24),

            // Products Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Featured Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const Gap(12),

            Obx(() {
              if (productController.isLoding.value) {
                return const LinearProgressIndicator();
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.52,
                  ),
                  itemCount: productController.products.value.data.length,
                  itemBuilder: (context, index) {
                    var product = productController.products.value.data[index];
                    return GestureDetector(
                      onTap: () {
                        productController.fetchProduct(product.id);
                        Get.to(() => ProductView());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 12,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                              child: Image.network(
                                "${product.image}",
                                height: 160,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  height: 160,
                                  color: Colors.grey[100],
                                  child: const Icon(Icons.image_not_supported, color: Colors.grey),
                                ),
                              ),
                            ),

                            // Details
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${product.title}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const Gap(6),
                                  Text(
                                    "\$${product.price}",
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  const Gap(10),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepPurple,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: const Text(
                                        "Add to Cart",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),

            const Gap(30),
          ],
        ),
      ),
    );
  }
}