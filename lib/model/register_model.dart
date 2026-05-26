class RegisterModel {
    RegisterModel({
        required this.success,
        required this.token,
        required this.message,
    });

    final bool? success;
    final String? token;
    final String? message;

    factory RegisterModel.fromJson(Map<String, dynamic> json){ 
        return RegisterModel(
            success: json["success"],
            token: json["token"],
            message: json["message"],
        );
    }

}
