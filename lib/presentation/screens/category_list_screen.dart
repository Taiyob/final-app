import 'package:e_commerce_app/presentation/state_holders/main_bottom_navbar_controller.dart';
import 'package:e_commerce_app/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_){
        Get.find<MainBottomNavbarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category list'),
        ),
        body: GridView.builder(
          itemCount: 15,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: FittedBox(child: CategoryItem()),
            );
          },
        ),
      ),
    );
  }
}
