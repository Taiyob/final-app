import 'package:e_commerce_app/presentation/state_holders/main_bottom_navbar_controller.dart';
import 'package:e_commerce_app/presentation/utility/app_colors.dart';
import 'package:e_commerce_app/presentation/widgets/product_card_item.dart';
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
      canPop: false,
      onPopInvoked: (_) {
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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ProductCardItem();
                },
              ),
            ),
            _buildCheckout(),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckout() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTotalPrice(),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPrice() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Price',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$1200',
          style: TextStyle(
            fontSize: 24,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
