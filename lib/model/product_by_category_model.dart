class ProductByCategoryModel {
    ProductByCategoryModel({
        required this.success,
        required this.category,
    });

    final bool? success;
    final Category? category;

    factory ProductByCategoryModel.fromJson(Map<String, dynamic> json){ 
        return ProductByCategoryModel(
            success: json["success"],
            category: json["category"] == null ? null : Category.fromJson(json["category"]),
        );
    }

}

class Category {
    Category({
        required this.id,
        required this.title,
        required this.slug,
        required this.products,
    });

    final int? id;
    final String? title;
    final String? slug;
    final List<Product> products;

    factory Category.fromJson(Map<String, dynamic> json){ 
        return Category(
            id: json["id"],
            title: json["title"],
            slug: json["slug"],
            products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
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
