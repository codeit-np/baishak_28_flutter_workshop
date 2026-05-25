class FeaturedProductModel {
    FeaturedProductModel({
        required this.success,
        required this.data,
    });

    final bool? success;
    final List<Datum> data;

    factory FeaturedProductModel.fromJson(Map<String, dynamic> json){ 
        return FeaturedProductModel(
            success: json["success"],
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

}

class Datum {
    Datum({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercent,
        required this.discountAmount,
        required this.discountedPrice,
        required this.image,
        required this.category,
        required this.isFeatured,
        required this.featuredOrder,
        required this.featuredImage,
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
    final bool? isFeatured;
    final int? featuredOrder;
    final String? featuredImage;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            id: json["id"],
            title: json["title"],
            description: json["description"],
            price: json["price"],
            discountPercent: json["discount_percent"],
            discountAmount: json["discount_amount"],
            discountedPrice: json["discounted_price"],
            image: json["image"],
            category: json["category"],
            isFeatured: json["is_featured"],
            featuredOrder: json["featured_order"],
            featuredImage: json["featured_image"],
        );
    }

}
