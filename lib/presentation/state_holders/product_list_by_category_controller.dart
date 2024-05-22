import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/data/models/product_list_by_category_model.dart';
import 'package:e_commerce_app/data/network_caller/network_caller.dart';
import 'package:e_commerce_app/data/utility/utils.dart';
import 'package:get/get.dart';

class ProductListByCategoryController extends GetxController{
  bool _inProgress = false;
  String _errorMessage = '';
  List<Product> _productList = [];

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;
  List<Product> get productList => _productList;

  Future<bool> getProduct(int categoryId) async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.productListByCategory(categoryId));
    if(response.isSuccess){
      _productList = ProductListByCategoryModel.fromJson(response.responseData).productList ?? [];
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}