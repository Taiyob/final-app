import 'package:e_commerce_app/data/models/category.dart';
import 'package:e_commerce_app/presentation/screens/product_list_screen.dart';
import 'package:e_commerce_app/presentation/utility/app_colors.dart';
import 'package:e_commerce_app/presentation/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key, required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> ProductListScreen(categoryName: category.categoryName ?? '', categoryId: category.id!,),);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: NetworkImages(
              url: category.categoryImg ?? '',
              height: 30,
              weight: 30,
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            category.categoryName ?? '',
            maxLines: 1,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
              letterSpacing: 0.4,
            ),
          )
        ],
      ),
    );
  }
}