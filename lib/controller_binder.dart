import 'package:e_commerce_app/presentation/state_holders/main_bottom_navbar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavbarController());
  }
}