class AllCategoryModel {
  bool? success;
  String? message;
  int? code;
  MainData? data;

  AllCategoryModel({
      this.success, 
      this.message, 
      this.code, 
      this.data
  });

  AllCategoryModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? MainData.fromJson(json['data']) : null;
  }
}

class MainData {
  List<Child1>? data;

  MainData({
      this.data
  });

  MainData.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Child1.fromJson(v));
      });
    }
  }
}

class Child1 {
  String? slug;
  String? name;
  String? icon;
  bool? showChildsInWebMobile;
  List<dynamic>? brands;
  List<Child2>? childs;

  Child1({
      this.slug, 
      this.name, 
      this.icon, 
      this.showChildsInWebMobile, 
      this.brands, 
      this.childs
  });

  Child1.fromJson(dynamic json) {
    slug = json['slug'];
    name = json['name'];
    icon = json['icon'];
    showChildsInWebMobile = json['show_childs_in_web_mobile'];
    if (json['brands'] != null) {
      brands = [];
      json['brands'].forEach((v) {
        // brands?.add(Dynamic.fromJson(v));
      });
    }
    if (json['childs'] != null) {
      childs = [];
      json['childs'].forEach((v) {
        childs?.add(Child2.fromJson(v));
      });
    }
  }
}

class Child2 {
  String? slug;
  String? name;
  bool? showChildsInWebMobile;
  List<Child3>? childs;

  Child2({
      this.slug, 
      this.name, 
      this.showChildsInWebMobile, 
      this.childs
  });

  Child2.fromJson(dynamic json) {
    slug = json['slug'];
    name = json['name'];
    showChildsInWebMobile = json['show_childs_in_web_mobile'];
    if (json['childs'] != null) {
      childs = [];
      json['childs'].forEach((v) {
        childs?.add(Child3.fromJson(v));
      });
    }
  }
}

class Child3 {
  String? slug;
  String? name;
  bool? showChildsInWebMobile;

  Child3({
      this.slug, 
      this.name, 
      this.showChildsInWebMobile
  });

  Child3.fromJson(dynamic json) {
    slug = json['slug'];
    name = json['name'];
    showChildsInWebMobile = json['show_childs_in_web_mobile'];
  }
}