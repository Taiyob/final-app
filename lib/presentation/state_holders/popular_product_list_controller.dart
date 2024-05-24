import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/data/models/product_list_model.dart';
import 'package:e_commerce_app/data/network_caller/network_caller.dart';
import 'package:e_commerce_app/data/utility/utils.dart';
import 'package:get/get.dart';

class PopularProductListController extends GetxController{
  bool _popularProductInProgress = false;
  //bool _specialProductInProgress = false;
  //bool _newProductInProgress = false;

  List<Product> _productList = [];
  //List<Product> _specialProductList = [];
  //List<Product> _newProductList = [];

  String _popularProductErrorMessage = '';
  //String _specialProductErrorMessage = '';
  //String _newProductErrorMessage = '';

  bool get popularProductInProgress => _popularProductInProgress;
  //bool get specialProductInProgress => _specialProductInProgress;
  //bool get newProductInProgress => _newProductInProgress;

  List<Product> get popularProductList => _productList;

  String get errorMessage => _popularProductErrorMessage;

  Future<bool> getPopularProductList() async{
    bool isSuccess = false;
      _popularProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.productListByRemark('Popular'),);
    if(response.isSuccess){
        _productList = ProductListModel.fromJson(response.responseData).productList ?? [];
        isSuccess = true;
    }else{
        _popularProductErrorMessage = response.errorMessage;
    }
      _popularProductInProgress = false;
    update();
    return isSuccess;
  }
}