// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'product_detail_model.g.dart';

ProductDetailModel welcomeFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

@HiveType(typeId: 0)
class ProductDetailModel {
  @HiveField(0)
  bool success;
  @HiveField(1)
  String message;
  @HiveField(2)
  int code;
  @HiveField(3)
  DetailModelData data;

  ProductDetailModel({
    required this.success,
    required this.message,
    required this.code,
    required this.data,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
    success: json["success"],
    message: json["message"],
    code: json["code"],
    data: DetailModelData.fromJson(json["data"]),
  );
}

@HiveType(typeId: 1)
class DetailModelData {
  @HiveField(0)
  DetailModelDataData data;

  DetailModelData({
    required this.data
  });

  factory DetailModelData.fromJson(Map<String, dynamic> json) => DetailModelData(
    data: DetailModelDataData.fromJson(json["data"]),
  );
}

@HiveType(typeId: 2)
class DetailModelDataData {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String guarantee;
  @HiveField(3)
  Catalog catalog;
  @HiveField(4)
  List<String> smallImages;
  @HiveField(5)
  List<String> largeImages;
  @HiveField(6)
  String availability;
  @HiveField(7)
  dynamic model;
  @HiveField(8)
  dynamic brand;
  @HiveField(9)
  int salePrice;
  @HiveField(10)
  int loanPrice;
  @HiveField(11)
  dynamic oldPrice;
  @HiveField(12)
  String monthlyPrice;
  @HiveField(13)
  String code;
  @HiveField(14)
  List<dynamic> saleMonths;
  @HiveField(15)
  int reviewsCount;
  @HiveField(16)
  dynamic reviewsMiddleRating;
  @HiveField(17)
  Seo seo;
  @HiveField(18)
  List<dynamic> stickers;
  @HiveField(19)
  List<MainCharacterElement> mainCharacters;
  @HiveField(20)
  List<OffersByImage> offersByImage;
  @HiveField(21)
  List<OffersByCharacter> offersByCharacter;
  @HiveField(22)
  List<Breadcrumb> breadcrumbs;
  @HiveField(23)
  dynamic description;
  @HiveField(24)
  String overview;
  @HiveField(25)
  List<PurpleCharacter> characters;
  @HiveField(26)
  List<AvailableStore> availableStores;
  @HiveField(27)
  List<dynamic> files;
  @HiveField(28)
  List<dynamic> accessories;

  DetailModelDataData({
    required this.id,
    required this.name,
    required this.guarantee,
    required this.catalog,
    required this.smallImages,
    required this.largeImages,
    required this.availability,
    required this.model,
    required this.brand,
    required this.salePrice,
    required this.loanPrice,
    required this.oldPrice,
    required this.monthlyPrice,
    required this.code,
    required this.saleMonths,
    required this.reviewsCount,
    required this.reviewsMiddleRating,
    required this.seo,
    required this.stickers,
    required this.mainCharacters,
    required this.offersByImage,
    required this.offersByCharacter,
    required this.breadcrumbs,
    required this.description,
    required this.overview,
    required this.characters,
    required this.availableStores,
    required this.files,
    required this.accessories,
  });

  factory DetailModelDataData.fromJson(Map<String, dynamic> json) => DetailModelDataData(
    id: json["id"] ?? '',
    name: json["name"]?? '',
    guarantee: json["guarantee"] ?? '',
    catalog: Catalog.fromJson(json["catalog"]) ,
    smallImages: List<String>.from(json["small_images"].map((x) => x)),
    largeImages: List<String>.from(json["large_images"].map((x) => x)),
    availability: json["availability"] ?? '',
    model: json["model"] ?? '',
    brand: json["brand"] ?? '',
    salePrice: json["sale_price"] ?? '',
    loanPrice: json["loan_price"] ?? '',
    oldPrice: json["old_price"] ?? '',
    monthlyPrice: json["monthly_price"] ?? '',
    code: json["code"] ?? '',
    saleMonths: List<dynamic>.from(json["sale_months"].map((x) => x)),
    reviewsCount: json["reviews_count"] ?? '',
    reviewsMiddleRating: json["reviews_middle_rating"] ?? '',
    seo: Seo.fromJson(json["seo"]),
    stickers: List<dynamic>.from(json["stickers"].map((x) => x)),
    mainCharacters: List<MainCharacterElement>.from(json["main_characters"].map((x) => MainCharacterElement.fromJson(x))),
    offersByImage: List<OffersByImage>.from(json["offers_by_image"].map((x) => OffersByImage.fromJson(x))),
    offersByCharacter: List<OffersByCharacter>.from(json["offers_by_character"].map((x) => OffersByCharacter.fromJson(x))),
    breadcrumbs: List<Breadcrumb>.from(json["breadcrumbs"].map((x) => Breadcrumb.fromJson(x))),
    description: json["description"] ?? '',
    overview: json["overview"] ?? '',
    characters: List<PurpleCharacter>.from(json["characters"].map((x) => PurpleCharacter.fromJson(x))),
    availableStores: List<AvailableStore>.from(json["available_stores"].map((x) => AvailableStore.fromJson(x))),
    files: List<dynamic>.from(json["files"].map((x) => x)),
    accessories: List<dynamic>.from(json["accessories"].map((x) => x)),
  );
}

@HiveType(typeId: 3)
class AvailableStore {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String lat;
  @HiveField(3)
  String long;
  @HiveField(4)
  String phone;
  @HiveField(5)
  String address;
  @HiveField(6)
  String description;
  @HiveField(7)
  String workTime;

  AvailableStore({
    required this.id,
    required this.name,
    required this.lat,
    required this.long,
    required this.phone,
    required this.address,
    required this.description,
    required this.workTime,
  });

  factory AvailableStore.fromJson(Map<String, dynamic> json) => AvailableStore(
    id: json["id"] ?? '',
    name: json["name"] ?? '',
    lat: json["lat"] ?? '',
    long: json["long"] ?? '',
    phone: json["phone"] ?? '',
    address: json["address"] ?? '',
    description: json["description"] ?? '',
    workTime: json["work_time"] ?? '',
  );
}

@HiveType(typeId: 4)
class Breadcrumb {
  @HiveField(0)
  String name;
  @HiveField(1)
  String? slug;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? type;

  Breadcrumb({
    required this.name,
    this.slug,
    this.id,
    this.type,
  });

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
    name: json["name"],
    slug: json["slug"],
    id: json["id"],
    type: json["type"],
  );
}

@HiveType(typeId: 5)
class Catalog {
  @HiveField(0)
  String name;
  @HiveField(1)
  int minPrice;
  @HiveField(2)
  int maxPrice;

  Catalog({
    required this.name,
    required this.minPrice,
    required this.maxPrice,
  });

  factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
    name: json["name"],
    minPrice: json["min_price"],
    maxPrice: json["max_price"],
  );
}

@HiveType(typeId: 6)
class PurpleCharacter {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<MainCharacterElement> characters;

  PurpleCharacter({
    required this.name,
    required this.characters,
  });

  factory PurpleCharacter.fromJson(Map<String, dynamic> json) => PurpleCharacter(
    name: json["name"],
    characters: List<MainCharacterElement>.from(json["characters"].map((x) => MainCharacterElement.fromJson(x))),
  );
}

@HiveType(typeId: 7)
class MainCharacterElement {
  @HiveField(0)
  String name;
  @HiveField(1)
  String value;

  MainCharacterElement({
    required this.name,
    required this.value,
  });

  factory MainCharacterElement.fromJson(Map<String, dynamic> json) => MainCharacterElement(
    name: json["name"],
    value: json["value"],
  );
}

@HiveType(typeId: 8)
class OffersByCharacter {
  @HiveField(0)
  String name;
  @HiveField(1)
  int characterId;
  @HiveField(2)
  List<Offer> offers;

  OffersByCharacter({
    required this.name,
    required this.characterId,
    required this.offers,
  });

  factory OffersByCharacter.fromJson(Map<String, dynamic> json) => OffersByCharacter(
    name: json["name"],
    characterId: json["character_id"],
    offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
  );
}

@HiveType(typeId: 9)
class Offer {
  @HiveField(0)
  int offerId;
  @HiveField(1)
  String text;

  Offer({
    required this.offerId,
    required this.text,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    offerId: json["offer_id"],
    text: json["text"],
  );
}

@HiveType(typeId: 10)
class OffersByImage {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String image;

  OffersByImage({
    required this.id,
    required this.name,
    required this.image,
  });

  factory OffersByImage.fromJson(Map<String, dynamic> json) => OffersByImage(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );
}

@HiveType(typeId: 11)
class Seo {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String keywords;
  @HiveField(3)
  String image;
  @HiveField(4)
  String scriptSeo;

  Seo({
    required this.title,
    required this.description,
    required this.keywords,
    required this.image,
    required this.scriptSeo,
  });

  factory Seo.fromJson(Map<String, dynamic> json) => Seo(
    title: json["title"],
    description: json["description"],
    keywords: json["keywords"],
    image: json["image"],
    scriptSeo: json["script_seo"],
  );
}