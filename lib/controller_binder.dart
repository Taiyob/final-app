import 'package:e_commerce_app/presentation/state_holders/category_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/home_slider_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/main_bottom_navbar_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/popular_product_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavbarController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(ProductListByCategoryController());
    Get.put(PopularProductListController());
  }
}
