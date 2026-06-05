import 'package:ecommerce/controller/storage_controller.dart';
import 'package:ecommerce/model/register_model.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:ecommerce/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var registerUser = RegisterModel(
    success: false,
    token: null,
    message: null,
  ).obs;
  var obsecure = true.obs;

  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  void checkAuth() {
    var storageController = Get.find<StorageController>();
    var token = storageController.getToken();
  
    if(token != null){
      //Dashboard
       Future.delayed(Duration(seconds: 3), () {
       Get.offNamed(AppRoutes.home);
    });
    }else{
      // login page
       Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.login);
    });
    }
   
  }

  Future register() async {
    try {
      isLoading(true);
      var response = await AuthService.register(
        name.text,
        email.text,
        password.text,
      );
      if (response != null) {
        registerUser.value = RegisterModel.fromJson(response.data);
        if (registerUser.value.success == true) {
          Get.snackbar("Success", "Account Created Successfully");
        } else {
          Get.snackbar("Error", "Something went wrong");
        }
      }
    } finally {
      isLoading(false);
    }
  }

  Future login() async {
    try {
      isLoading(true);
      var response = await AuthService.login(email.text, password.text);
      if (response != null) {
        registerUser.value = RegisterModel.fromJson(response.data);
        if (registerUser.value.success == true) {
          //Goto dashpard
          var storageController = Get.find<StorageController>();
          storageController.saveLogin(registerUser.value.token!);
          Get.offAll(() => HomeView());
        } else {
          Get.snackbar("Error", "Something went wrong");
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void tooglePassword() {
    obsecure.value = !obsecure.value;
  }

  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }
}
