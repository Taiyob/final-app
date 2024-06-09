import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/network_caller/network_caller.dart';
import 'package:e_commerce_app/data/utility/utils.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;

  Future<bool> verifyEmail(String email) async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.verifyEmail(email));
    if(response.isSuccess){
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}