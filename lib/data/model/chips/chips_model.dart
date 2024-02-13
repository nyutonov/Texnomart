class ChipsModel {
  bool? success;
  String? message;
  int? code;
  Data? data;

  ChipsModel({
      this.success, 
      this.message, 
      this.code, 
      this.data
  });

  ChipsModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  ParentChips? parent;
  List<Categories>? categories;

  Data({
      this.parent, 
      this.categories
  });

  Data.fromJson(dynamic json) {
    parent = json['parent'] != null ? ParentChips.fromJson(json['parent']) : null;
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;

  Categories({
      this.id, 
      this.name, 
      this.slug
  });

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }
}

class ParentChips {
  int? id;
  String? name;
  String? slug;

  ParentChips({
      this.id, 
      this.name, 
      this.slug
  });

  ParentChips.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }
}