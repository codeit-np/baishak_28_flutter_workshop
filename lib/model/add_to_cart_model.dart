class AddToCartModel {
    AddToCartModel({
        required this.success,
        required this.message,
    });

    final bool? success;
    final String? message;

    factory AddToCartModel.fromJson(Map<String, dynamic> json){ 
        return AddToCartModel(
            success: json["success"],
            message: json["message"],
        );
    }

}
