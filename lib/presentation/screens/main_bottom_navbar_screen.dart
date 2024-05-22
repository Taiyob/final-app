import 'package:e_commerce_app/presentation/screens/cart_list_screen.dart';
import 'package:e_commerce_app/presentation/screens/category_list_screen.dart';
import 'package:e_commerce_app/presentation/screens/home_screen.dart';
import 'package:e_commerce_app/presentation/screens/wish_list_screen.dart';
import 'package:e_commerce_app/presentation/state_holders/category_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/home_slider_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/main_bottom_navbar_controller.dart';
import 'package:e_commerce_app/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavbarScreen extends StatefulWidget {
  const MainBottomNavbarScreen({super.key});

  @override
  State<MainBottomNavbarScreen> createState() => _MainBottomNavbarScreenState();
}

class _MainBottomNavbarScreenState extends State<MainBottomNavbarScreen> {
  final MainBottomNavbarController _navbarController =
      Get.find<MainBottomNavbarController>();
  final HomeSliderController _homeSliderController = Get.find<HomeSliderController>();

  final List _screens = const[
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _homeSliderController.getSliders();
    Get.find<CategoryListController>().getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavbarController>(
        builder: (_) {
          return _screens[_navbarController.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavbarController>(
        builder: (_) {
          return BottomNavigationBar(
            currentIndex: _navbarController.selectedIndex,
            onTap: (index) {
              _navbarController.changeIndex(index);
            },
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.window_sharp), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_rounded), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: 'Wish'),
            ],
          );
        },
      ),
    );
  }
}
