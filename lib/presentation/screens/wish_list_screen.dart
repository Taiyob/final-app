import 'package:e_commerce_app/presentation/state_holders/main_bottom_navbar_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/wish_list_controller.dart';
import 'package:e_commerce_app/presentation/widgets/centered_circular_progess.dart';
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
  void initState() {
    super.initState();
    Get.find<WishListController>().getWishList();
  }

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
        body: GetBuilder<WishListController>(
          builder: (wishListController){
            if(wishListController.inProgress){
              return const CenteredCircularProgressWidget();
            }
            return GridView.builder(
              itemCount: wishListController.productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: FittedBox(child: ProductCard(showAddToWishList: false, product: wishListController.productList[index],),),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
