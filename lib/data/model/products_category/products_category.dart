class ProductsCategory {
  bool? success;
  String? message;
  int? code;
  Data? data;

  ProductsCategory({
      this.success, 
      this.message, 
      this.code, 
      this.data,});

  ProductsCategory.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Products>? products;
  List<Filter>? filter;
  Price? price;
  List<Stickers>? stickers;
  List<Brands>? brands;
  List<SaleMonths>? saleMonths;
  int? saleMonthsCount;
  int? brandsCount;
  Pagination? pagination;

  Data({
      this.products, 
      this.filter, 
      this.price, 
      this.stickers, 
      this.brands, 
      this.saleMonths, 
      this.saleMonthsCount, 
      this.brandsCount, 
      this.pagination
  });

  Data.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    if (json['filter'] != null) {
      filter = [];
      json['filter'].forEach((v) {
        filter?.add(Filter.fromJson(v));
      });
    }
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    if (json['stickers'] != null) {
      stickers = [];
      json['stickers'].forEach((v) {
        stickers?.add(Stickers.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = [];
      json['brands'].forEach((v) {
        brands?.add(Brands.fromJson(v));
      });
    }
    if (json['sale_months'] != null) {
      saleMonths = [];
      json['sale_months'].forEach((v) {
        saleMonths?.add(SaleMonths.fromJson(v));
      });
    }
    saleMonthsCount = json['sale_months_count'];
    brandsCount = json['brands_count'];
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
}

class Pagination {
  int? totalCount;
  int? currentPage;
  int? totalPage;
  int? pageSize;

  Pagination({
      this.totalCount, 
      this.currentPage, 
      this.totalPage, 
      this.pageSize
  });

  Pagination.fromJson(dynamic json) {
    totalCount = json['total_count'];
    currentPage = json['current_page'];
    totalPage = json['total_page'];
    pageSize = json['page_size'];
  }
}

class SaleMonths {
  int? id;
  String? key;
  String? name;
  String? appTitle;
  int? count;

  SaleMonths({
      this.id, 
      this.key, 
      this.name, 
      this.appTitle, 
      this.count
  });

  SaleMonths.fromJson(dynamic json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    appTitle = json['app_title'];
    count = json['count'];
  }
}

class Brands {
  int? id;
  String? name;
  int? count;

  Brands({
      this.id, 
      this.name, 
      this.count
  });

  Brands.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
  }
}

class Stickers {
  int? id;
  String? name;
  int? count;

  Stickers({
      this.id, 
      this.name, 
      this.count
  });

  Stickers.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
  }
}

class Price {
  int? maxPrice;
  int? minPrice;

  Price({
      this.maxPrice, 
      this.minPrice
  });

  Price.fromJson(dynamic json) {
    maxPrice = json['max_price'];
    minPrice = json['min_price'];
  }
}

class Filter {
  int? id;
  String? name;
  int? count;
  List<Values>? values;

  Filter({
      this.id, 
      this.name, 
      this.count, 
      this.values
  });

  Filter.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    if (json['values'] != null) {
      values = [];
      json['values'].forEach((v) {
        values?.add(Values.fromJson(v));
      });
    }
  }
}

class Values {
  int? id;
  String? value;
  int? count;

  Values({
      this.id, 
      this.value, 
      this.count
  });

  Values.fromJson(dynamic json) {
    id = json['id'];
    value = json['value'];
    count = json['count'];
  }
}

class Products {
  int? id;
  String? name;
  String? image;
  dynamic saleMonths;
  dynamic stickers;
  String? availability;
  int? discount;
  String? code;
  List<MainCharacters>? mainCharacters;
  int? salePrice;
  String? fSalePrice;
  dynamic oldPrice;
  dynamic fOldPrice;
  dynamic loanPrice;
  String? fLoanPrice;
  String? axiomMonthlyPrice;
  int? reviewsCount;
  dynamic reviewsAverage;
  int? allCount;
  Brand? brand;

  Products({
      this.id, 
      this.name, 
      this.image, 
      this.saleMonths, 
      this.stickers, 
      this.availability, 
      this.discount, 
      this.code, 
      this.mainCharacters, 
      this.salePrice, 
      this.fSalePrice, 
      this.oldPrice, 
      this.fOldPrice, 
      this.loanPrice, 
      this.fLoanPrice, 
      this.axiomMonthlyPrice, 
      this.reviewsCount, 
      this.reviewsAverage, 
      this.allCount, 
      this.brand
  });

  Products.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    saleMonths = json['sale_months'];
    stickers = json['stickers'];
    availability = json['availability'];
    discount = json['discount'];
    code = json['code'];
    if (json['main_characters'] != null) {
      mainCharacters = [];
      json['main_characters'].forEach((v) {
        mainCharacters?.add(MainCharacters.fromJson(v));
      });
    }
    salePrice = json['sale_price'];
    fSalePrice = json['f_sale_price'];
    oldPrice = json['old_price'];
    fOldPrice = json['f_old_price'];
    loanPrice = json['loan_price'];
    fLoanPrice = json['f_loan_price'];
    axiomMonthlyPrice = json['axiom_monthly_price'];
    reviewsCount = json['reviews_count'];
    reviewsAverage = json['reviews_average'];
    allCount = json['all_count'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }
}

class Brand {
  int? id;
  String? slug;
  String? name;

  Brand({
      this.id, 
      this.slug, 
      this.name
  });

  Brand.fromJson(dynamic json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
  }
}

class MainCharacters {
  String? name;
  String? value;
  int? order;

  MainCharacters({
      this.name, 
      this.value, 
      this.order
  });

  MainCharacters.fromJson(dynamic json) {
    name = json['name'] ?? '';
    value = json['value'] ?? '';
    order = json['order'] ?? 0;
  }
}