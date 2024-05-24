import 'package:e_commerce_app/presentation/state_holders/main_bottom_navbar_controller.dart';
import 'package:e_commerce_app/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavbarController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WishList'),
        ),
        body: GridView.builder(
          itemCount: 15,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              // child: FittedBox(child: ProductCard(showAddToWishList: false,),),
            );
          },
        ),
      ),
    );
  }
}
