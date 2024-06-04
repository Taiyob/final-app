import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/product_details_model.dart';
import 'package:e_commerce_app/data/models/product_details_wrapper_model.dart';
import 'package:e_commerce_app/data/network_caller/network_caller.dart';
import 'package:e_commerce_app/data/utility/utils.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;
  ProductDetailsModel get productDetailsModel => _productDetailsModel;

  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.productDetails(productId));
    if (response.isSuccess) {
      if(_errorMessage.isNotEmpty){
        _errorMessage = '';
      }
      _productDetailsModel =
          ProductDetailsWrapperModel.fromJson(response.responseData)
              .productDetails!
              .first;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
