import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/services/category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  var isLoading = false.obs;
  var categories = CategoryModel(success: false, data: []).obs;

  Future getCategories() async{
    try{
      isLoading(true);
      var response = await CategoryService.getCategories();
      if(response != null){
        categories.value = CategoryModel.fromJson(response.data);
      }
    }finally{
    isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
  }
}