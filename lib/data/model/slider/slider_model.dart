// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:texnomart_demo/data/model/parent.dart';

SliderModel welcomeFromJson(String str) => SliderModel.fromJson(json.decode(str));

String welcomeToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel extends Parent {
  bool success;
  String message;
  int code;
  SliderData data;

  SliderModel({
    required this.success,
    required this.message,
    required this.code,
    required this.data,
  });

  SliderModel copyWith({
    bool? success,
    String? message,
    int? code,
    SliderData? data,
  }) =>
      SliderModel(
        success: success ?? this.success,
        message: message ?? this.message,
        code: code ?? this.code,
        data: data ?? this.data,
      );

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    success: json["success"],
    message: json["message"],
    code: json["code"],
    data: SliderData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "code": code,
    "data": data.toJson(),
  };
}

class SliderData {
  List<SliderDatum> data;

  SliderData({
    required this.data,
  });

  SliderData copyWith({
    List<SliderDatum>? data,
  }) =>
      SliderData(
        data: data ?? this.data,
      );

  factory SliderData.fromJson(Map<String, dynamic> json) => SliderData(
    data: List<SliderDatum>.from(json["data"].map((x) => SliderDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SliderDatum {
  int id;
  String link;
  String title;
  String imageWeb;
  String imageMobileWeb;

  SliderDatum({
    required this.id,
    required this.link,
    required this.title,
    required this.imageWeb,
    required this.imageMobileWeb,
  });

  SliderDatum copyWith({
    int? id,
    String? link,
    String? title,
    String? imageWeb,
    String? imageMobileWeb,
  }) =>
      SliderDatum(
        id: id ?? this.id,
        link: link ?? this.link,
        title: title ?? this.title,
        imageWeb: imageWeb ?? this.imageWeb,
        imageMobileWeb: imageMobileWeb ?? this.imageMobileWeb,
      );

  factory SliderDatum.fromJson(Map<String, dynamic> json) => SliderDatum(
    id: json["id"],
    link: json["link"],
    title: json["title"],
    imageWeb: json["image_web"],
    imageMobileWeb: json["image_mobile_web"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link": link,
    "title": title,
    "image_web": imageWeb,
    "image_mobile_web": imageMobileWeb,
  };
}