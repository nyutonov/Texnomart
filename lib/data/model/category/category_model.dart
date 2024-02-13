// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:texnomart_demo/data/model/parent.dart';

CategoryModel welcomeFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String welcomeToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel extends Parent {
  bool success;
  String message;
  int code;
  CategoryData data;

  CategoryModel({
    required this.success,
    required this.message,
    required this.code,
    required this.data,
  });

  CategoryModel copyWith({
    bool? success,
    String? message,
    int? code,
    CategoryData? data,
  }) =>
      CategoryModel(
        success: success ?? this.success,
        message: message ?? this.message,
        code: code ?? this.code,
        data: data ?? this.data,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    success: json["success"],
    message: json["message"],
    code: json["code"],
    data: CategoryData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "code": code,
    "data": data.toJson(),
  };
}

class CategoryData {
  List<CategoryDatum> data;

  CategoryData({
    required this.data,
  });

  CategoryData copyWith({
    List<CategoryDatum>? data,
  }) =>
      CategoryData(
        data: data ?? this.data,
      );

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    data: List<CategoryDatum>.from(json["data"].map((x) => CategoryDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CategoryDatum {
  String title;
  String image;
  String slug;

  CategoryDatum({
    required this.title,
    required this.image,
    required this.slug,
  });

  CategoryDatum copyWith({
    String? title,
    String? image,
    String? slug,
  }) =>
      CategoryDatum(
        title: title ?? this.title,
        image: image ?? this.image,
        slug: slug ?? this.slug,
      );

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
    title: json["title"],
    image: json["image"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    "slug": slug,
  };
}