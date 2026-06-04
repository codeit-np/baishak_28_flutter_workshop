class CartModel {
    CartModel({
        required this.sucess,
        required this.data,
    });

    final bool? sucess;
    final List<Datum> data;

    factory CartModel.fromJson(Map<String, dynamic> json){ 
        return CartModel(
            sucess: json["sucess"],
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

}

class Datum {
    Datum({
        required this.cartId,
        required this.productId,
        required this.productName,
        required this.productPrice,
        required this.sellingPrice,
        required this.quantity,
        required this.discount,
        required this.discountAmt,
        required this.totalAmt,
        required this.productImage,
    });

    final int? cartId;
    final int? productId;
    final String? productName;
    final int? productPrice;
    final int? sellingPrice;
    final int? quantity;
    final String? discount;
    final int? discountAmt;
    final int? totalAmt;
    final String? productImage;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            cartId: json["cart_id"],
            productId: json["product_id"],
            productName: json["product_name"],
            productPrice: json["product_price"],
            sellingPrice: json["selling_price"],
            quantity: json["quantity"],
            discount: json["discount"],
            discountAmt: json["discount_amt"],
            totalAmt: json["total_amt"],
            productImage: json["product_image"],
        );
    }

}
