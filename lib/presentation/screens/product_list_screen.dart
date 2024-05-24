import 'package:e_commerce_app/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:e_commerce_app/presentation/widgets/centered_circular_progess.dart';
import 'package:e_commerce_app/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen(
      {super.key, required this.categoryName, required this.categoryId});

  final String categoryName;
  final int categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductListByCategoryController>().getProduct(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: GetBuilder<ProductListByCategoryController>(
        builder: (productListByCategoryController) {
          if (productListByCategoryController.inProgress) {
            return const CenteredCircularProgressWidget();
          }
          return GridView.builder(
            itemCount: productListByCategoryController.productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return FittedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: ProductCard(
                    product: productListByCategoryController.productList[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
