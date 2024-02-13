import 'package:texnomart_demo/data/model/parent.dart';

class ProductModel extends Parent {
  bool? success;
  String? message;
  int? code;
  MainData? data;

  ProductModel({
      this.success, 
      this.message, 
      this.code, 
      this.data
  });

  ProductModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? MainData.fromJson(json['data']) : null;
  }
}

class MainData {
  List<Data>? data;

  MainData({
      this.data
  });

  MainData.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  String? availability;
  String? axiomMonthlyPrice;
  int? salePrice;
  dynamic oldPrice;
  int? reviewsCount;
  dynamic reviewsAverage;
  int? allCount;
  List<dynamic>? stickers;
  List<dynamic>? saleMonths;

  Data({
      this.id, 
      this.name, 
      this.image, 
      this.availability, 
      this.axiomMonthlyPrice, 
      this.salePrice, 
      this.oldPrice, 
      this.reviewsCount, 
      this.reviewsAverage, 
      this.allCount, 
      this.stickers, 
      this.saleMonths
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    availability = json['availability'];
    axiomMonthlyPrice = json['axiom_monthly_price'];
    salePrice = json['sale_price'];
    oldPrice = json['old_price'];
    reviewsCount = json['reviews_count'];
    reviewsAverage = json['reviews_average'];
    allCount = json['all_count'];
    if (json['stickers'] != null) {
      stickers = [];
      json['stickers'].forEach((v) {
        // stickers?.add(Dynamic.fromJson(v));
      });
    }
    if (json['sale_months'] != null) {
      saleMonths = [];
      json['sale_months'].forEach((v) {
        // saleMonths?.add(Dynamic.fromJson(v));
      });
    }
  }
}