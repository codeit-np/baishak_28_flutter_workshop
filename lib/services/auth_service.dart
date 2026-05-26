import 'package:ecommerce/utils/api_connect.dart';

class AuthService {
  // Register
  static Future register(String name,String email, String password) async{
    var response = await ApiConnect.dio.post("register",data: {"name" :name,"email" : email,"password": password });
    return response;
  }

  //Login
  static Future login(String email, String password) async{
    var response = await ApiConnect.dio.post("login",data: {"email" : email,"password": password });
    return response;
  }

  //Logout

  //Forgot Password

  // Chnage Password
}