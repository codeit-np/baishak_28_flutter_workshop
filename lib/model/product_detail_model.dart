class ProductDetailModel {
    ProductDetailModel({
        required this.product,
    });

    final Product? product;

    factory ProductDetailModel.fromJson(Map<String, dynamic> json){ 
        return ProductDetailModel(
            product: json["product"] == null ? null : Product.fromJson(json["product"]),
        );
    }

}

class Product {
    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercent,
        required this.discountAmount,
        required this.discountedPrice,
        required this.image,
        required this.category,
    });

    final int? id;
    final String? title;
    final String? description;
    final int? price;
    final String? discountPercent;
    final int? discountAmount;
    final int? discountedPrice;
    final String? image;
    final String? category;

    factory Product.fromJson(Map<String, dynamic> json){ 
        return Product(
            id: json["id"],
            title: json["title"],
            description: json["description"],
            price: json["price"],
            discountPercent: json["discount_percent"],
            discountAmount: json["discount_amount"],
            discountedPrice: json["discounted_price"],
            image: json["image"],
            category: json["category"],
        );
    }

}
