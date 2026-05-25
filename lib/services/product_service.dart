
import 'package:ecommerce/utils/api_connect.dart';

class ProductService {
  static Future getProducts() async{
    var response = await ApiConnect.dio.get("products");
    return response;
  }

  static Future getProduct(int id) async{
    var response = await ApiConnect.dio.get("product/$id");
    return response;
  }

  //Featurd Product
   static Future getFeaturedProducts() async{
    var response = await ApiConnect.dio.get("featured-products");
    return response;
  }
}