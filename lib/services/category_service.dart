
import 'package:ecommerce/utils/api_connect.dart';

class CategoryService {
  static Future getCategories() async{
    var response = await ApiConnect.dio.get("categories");
    return response;
  }

  static Future getProductByCategory(int id) async{
    var response = await ApiConnect.dio.get("category/$id");
    return response;
  }
}