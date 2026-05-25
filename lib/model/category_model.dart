class CategoryModel {
    CategoryModel({
        required this.success,
        required this.data,
    });

    final bool? success;
    final List<Datum> data;

    factory CategoryModel.fromJson(Map<String, dynamic> json){ 
        return CategoryModel(
            success: json["success"],
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

}

class Datum {
    Datum({
        required this.id,
        required this.title,
        required this.slug,
    });

    final int? id;
    final String? title;
    final String? slug;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            id: json["id"],
            title: json["title"],
            slug: json["slug"],
        );
    }

}
