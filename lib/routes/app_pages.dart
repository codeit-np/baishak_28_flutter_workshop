import 'package:ecommerce/bindings/cart_binding.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/views/cart_view.dart';
import 'package:ecommerce/views/home_view.dart';
import 'package:ecommerce/views/login_view.dart';
import 'package:ecommerce/views/order_complete.dart';
import 'package:ecommerce/views/order_view.dart';
import 'package:ecommerce/views/product_by_category_view.dart';
import 'package:ecommerce/views/product_view.dart';
import 'package:ecommerce/views/register_view.dart';
import 'package:ecommerce/views/splash_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static var routes = [
      GetPage(name: AppRoutes.splash, page: () => SplashView()),
      GetPage(name: AppRoutes.login, page: () => LoginView()),
      GetPage(name: AppRoutes.register, page: () => RegisterView()),
      GetPage(name: AppRoutes.home, page: () => HomeView(),binding: CartBinding()),
      GetPage(name: AppRoutes.productByCategories, page: () => ProductByCategoryView()),
      GetPage(name: AppRoutes.productDetail, page: () => ProductView()),
      GetPage(name: AppRoutes.carts, page: () => CartView()),
      GetPage(name: AppRoutes.order, page: () => OrderView()),
      GetPage(name: AppRoutes.orderComplete, page: () => OrderComplete()),
  ];
}