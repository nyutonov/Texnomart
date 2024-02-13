// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import '../parent.dart';

BrandModel welcomeFromJson(String str) => BrandModel.fromJson(json.decode(str));

String welcomeToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel extends Parent {
  bool success;
  String message;
  int code;
  BrandData data;

  BrandModel({
    required this.success,
    required this.message,
    required this.code,
    required this.data,
  });

  BrandModel copyWith({
    bool? success,
    String? message,
    int? code,
    BrandData? data,
  }) =>
      BrandModel(
        success: success ?? this.success,
        message: message ?? this.message,
        code: code ?? this.code,
        data: data ?? this.data,
      );

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    success: json["success"],
    message: json["message"],
    code: json["code"],
    data: BrandData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "code": code,
    "data": data.toJson(),
  };
}

class BrandData {
  List<BrandDatum> data;

  BrandData({
    required this.data,
  });

  BrandData copyWith({
    List<BrandDatum>? data,
  }) =>
      BrandData(
        data: data ?? this.data,
      );

  factory BrandData.fromJson(Map<String, dynamic> json) => BrandData(
    data: List<BrandDatum>.from(json["data"].map((x) => BrandDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BrandDatum {
  String name;
  String slug;
  String image;
  String? imageAlt;
  Meta meta;

  BrandDatum({
    required this.name,
    required this.slug,
    required this.image,
    required this.imageAlt,
    required this.meta,
  });

  BrandDatum copyWith({
    String? name,
    String? slug,
    String? image,
    String? imageAlt,
    Meta? meta,
  }) =>
      BrandDatum(
        name: name ?? this.name,
        slug: slug ?? this.slug,
        image: image ?? this.image,
        imageAlt: imageAlt ?? this.imageAlt,
        meta: meta ?? this.meta,
      );

  factory BrandDatum.fromJson(Map<String, dynamic> json) => BrandDatum(
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    imageAlt: json["image_alt"],
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
    "image": image,
    "image_alt": imageAlt,
    "meta": meta.toJson(),
  };
}

class Meta {
  String? title;
  dynamic description;
  dynamic keywords;

  Meta({
    required this.title,
    required this.description,
    required this.keywords,
  });

  Meta copyWith({
    String? title,
    dynamic description,
    dynamic keywords,
  }) =>
      Meta(
        title: title ?? this.title,
        description: description ?? this.description,
        keywords: keywords ?? this.keywords,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    title: json["title"],
    description: json["description"],
    keywords: json["keywords"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "keywords": keywords,
  };
}