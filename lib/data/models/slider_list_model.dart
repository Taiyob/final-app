import 'package:e_commerce_app/data/models/slider_data.dart';

class SliderListModel {
  String? msg;
  List<SliderData>? sliderList;

  SliderListModel({this.msg, this.sliderList});

  SliderListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderList = <SliderData>[];
      json['data'].forEach((v) {
        sliderList!.add(new SliderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.sliderList != null) {
      data['data'] = this.sliderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


