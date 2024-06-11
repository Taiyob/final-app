import 'package:e_commerce_app/presentation/screens/email_verification_screen.dart';
import 'package:e_commerce_app/presentation/state_holders/user_auth_controller.dart';
import 'package:get/get.dart';

class MainBottomNavbarController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex {
    return _selectedIndex;
  }

  Future<void> changeIndex(int index) async {
    if(index == 2 || index == 3){
      final isLoggedIn = await UserAuthController.checkLoggedInState();
      if(!isLoggedIn){
        Get.to(()=> const EmailVerificationScreen(),);
      }
      return;
    }
    _selectedIndex = index;
    update();
  }

  void backToHome() {
    changeIndex(0);
  }

  void goToCategory() {
    changeIndex(1);
  }
}
