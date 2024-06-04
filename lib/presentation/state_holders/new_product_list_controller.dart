import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/data/models/product_list_model.dart';
import 'package:e_commerce_app/data/network_caller/network_caller.dart';
import 'package:e_commerce_app/data/utility/utils.dart';
import 'package:get/get.dart';

class NewProductListController extends GetxController {
  bool _inProgress = false;

  List<Product> _productList = [];

  String _popularProductErrorMessage = '';

  bool get inProgress => _inProgress;

  List<Product> get popularProductList => _productList;

  String get errorMessage => _popularProductErrorMessage;

  Future<bool> getNewProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.productListByRemark('New'),
    );
    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    } else {
      _popularProductErrorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
