import 'package:ecommerce/bindings/controller_binding.dart';
import 'package:ecommerce/routes/app_pages.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.splash,
      initialBinding: ControllerBinding(),
      getPages: AppPages.routes,
    );
  }
}
