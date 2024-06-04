import 'package:e_commerce_app/data/models/product_details_model.dart';

class ProductDetailsWrapperModel {
  String? msg;
  List<ProductDetailsModel>? productDetails;

  ProductDetailsWrapperModel({this.msg, this.productDetails});

  ProductDetailsWrapperModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productDetails = <ProductDetailsModel>[];
      json['data'].forEach((v) {
        productDetails!.add(new ProductDetailsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.productDetails != null) {
      data['data'] = this.productDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
