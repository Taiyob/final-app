import 'package:e_commerce_app/presentation/state_holders/main_bottom_navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      // this is for WillPopScope
      // onWillPop: () async {
      //   Get.find<MainBottomNavbarController>().backToHome();
      //   return false;
      // },
      canPop: false,
      onPopInvoked: (_){
        Get.find<MainBottomNavbarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Carts'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavbarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios_sharp),
          ),
        ),
      ),
    );
  }
}
