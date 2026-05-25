
import 'package:ecommerce/utils/api_connect.dart';

class CategoryService {
  static Future getCategories() async{
  
    var response = await ApiConnect.dio.get("categories");
   
    return response;
  }
}