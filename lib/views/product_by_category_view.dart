import 'package:ecommerce/controller/category_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/views/product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductByCategoryView extends GetView<CategoryController> {
  const ProductByCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var productController = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.products.value.category?.title ?? "Products")),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final products = controller.products.value.category?.products ?? [];

        if (products.isEmpty) {
          return const Center(child: Text("No products found in this category"));
        }

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,        // Reduced to prevent overflow
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index];
              final double originalPrice = product.price?.toDouble() ?? 0.0;
              final double discountedPrice = product.discountedPrice?.toDouble() ?? 0.0;
              final int discountPercent = originalPrice > 0 
                  ? ((originalPrice - discountedPrice) / originalPrice * 100).round() 
                  : 0;

              return GestureDetector(
                onTap: () {
                  productController.fetchProduct(product.id!);
                  Get.to(() =>  ProductView());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.12),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Image - Reduced Height
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.network(
                          product.image ?? '',
                          height: 140,                    // Reduced from 165
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            height: 140,
                            color: Colors.grey[200],
                            child: const Icon(Icons.image_not_supported, size: 45, color: Colors.grey),
                          ),
                        ),
                      ),

                      Expanded(                         // Added Expanded to prevent overflow
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Text(
                                product.title ?? 'No Title',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3,
                                ),
                              ),

                              const Spacer(),           // Pushes price to bottom

                              // Discount Badge
                              if (discountPercent > 0)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "-$discountPercent% OFF",
                                    style: TextStyle(
                                      color: Colors.red.shade700,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                              const SizedBox(height: 8),

                              // Price Section
                              Row(
                                children: [
                                  Text(
                                    "Rs.${discountedPrice.toStringAsFixed(0)}",
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  if (originalPrice > discountedPrice)
                                    Text(
                                      "Rs.${originalPrice.toStringAsFixed(0)}",
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        color: Colors.grey[600],
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
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
    );
  }
}