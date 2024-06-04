import 'package:e_commerce_app/data/models/category.dart';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/presentation/state_holders/category_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/home_slider_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/main_bottom_navbar_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/new_product_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/popular_product_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/special_product_list_controller.dart';
import 'package:e_commerce_app/presentation/utility/assets_path.dart';
import 'package:e_commerce_app/presentation/widgets/app_bar_icon_button.dart';
import 'package:e_commerce_app/presentation/widgets/category_item.dart';
import 'package:e_commerce_app/presentation/widgets/centered_circular_progess.dart';
import 'package:e_commerce_app/presentation/widgets/home_carousel_slider.dart';
import 'package:e_commerce_app/presentation/widgets/product_card.dart';
import 'package:e_commerce_app/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavbarController>().backToHome();
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                buildSearchTextField(),
                const SizedBox(height: 16),
                GetBuilder<HomeSliderController>(builder: (sliderController) {
                  if (sliderController.inProgress) {
                    return const SizedBox(
                      height: 200,
                      child: CenteredCircularProgressWidget(),
                    );
                  }
                  return HomeCarouselSlider(
                    sliderList: sliderController.sliderList,
                  );
                }),
                const SizedBox(height: 16),
                SectionHeader(
                  title: 'All Category',
                  onTapSeeAll: () {
                    Get.find<MainBottomNavbarController>().goToCategory();
                  },
                ),
                const SizedBox(height: 10),
                GetBuilder<CategoryListController>(
                    builder: (categoryController) {
                  if (categoryController.inProgress) {
                    return const SizedBox(
                      height: 100,
                      child: CenteredCircularProgressWidget(),
                    );
                  }
                  return _buildCategoryListView(
                      categoryController.categoryList);
                }),
                const SizedBox(height: 8),
                SectionHeader(
                  title: 'Popular',
                  onTapSeeAll: () {},
                ),
                const SizedBox(height: 10),
                GetBuilder<PopularProductListController>(
                    builder: (popularProductListController) {
                  if (popularProductListController.popularProductInProgress) {
                    return const SizedBox(
                      height: 210,
                      child: CenteredCircularProgressWidget(),
                    );
                  }
                  return _buildProductListView(
                    popularProductListController.popularProductList,
                  );
                }),
                const SizedBox(height: 8),
                SectionHeader(
                  title: 'Special',
                  onTapSeeAll: () {},
                ),
                const SizedBox(height: 10),
                GetBuilder<SpecialProductListController>(
                    builder: (specialProductListController) {
                  if (specialProductListController.inProgress) {
                    return const SizedBox(
                      height: 210,
                      child: CenteredCircularProgressWidget(),
                    );
                  }
                  return _buildProductListView(
                    specialProductListController.popularProductList,
                  );
                }),
                const SizedBox(height: 8),
                SectionHeader(
                  title: 'New',
                  onTapSeeAll: () {},
                ),
                const SizedBox(height: 10),
                GetBuilder<NewProductListController>(
                    builder: (newProductListController) {
                  if (newProductListController.inProgress) {
                    return const SizedBox(
                      height: 210,
                      child: CenteredCircularProgressWidget(),
                    );
                  }
                  return _buildProductListView(
                    newProductListController.popularProductList,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductListView(List<Product> productList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: productList.map((e)=> ProductCard(product: e)).toList(),
      ),
    );
  }

  Widget _buildCategoryListView(List<Category> categoryList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoryList.map((e)=> Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CategoryItem(category: e),
            const SizedBox(width: 16,),
          ],
        )).toList(),
      ),
    );
  }

  Widget buildSearchTextField() {
    return TextField(
      controller: _searchTEController,
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appBarLogoSvg),
      actions: [
        AppBarIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.notifications_off_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }
}
