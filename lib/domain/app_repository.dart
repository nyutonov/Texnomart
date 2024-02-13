import 'package:texnomart_demo/data/model/all_category/all_category.dart';
import 'package:texnomart_demo/data/model/parent.dart';
import 'package:texnomart_demo/data/source/local/hive/hive_helper.dart';
import 'package:texnomart_demo/data/source/remote/dio/dio_service.dart';

import '../data/model/chips/chips_model.dart';
import '../data/model/products_category/products_category.dart';
import '../data/model/product_detail/product_detail_model.dart';

class AppRepository {
  // final dioService = locator
  //     .get<DioService>();

  final _dioService = DioService();
  final _hiveHelper = HiveHelper();

  Future<List<Parent>> getAll() async => _dioService.getAll();
  Future<ProductsCategory?> getAllProductsInCategory(String category, int page) async => _dioService.getAllProductsInCategory(category, page);
  Future<ProductDetailModel?> getProductDetail(int id) async => _dioService.getProductDetails(id);
  Future<AllCategoryModel?> getAllCategories() async => _dioService.getAllCategories();
  Future<ChipsModel?> getAllChips(String category) async => _dioService.getAllChips(category);

  addProductToLikes(ProductDetailModel product) async => await _hiveHelper.addProduct(product);
  deleteProductInLikes(int id) async => await _hiveHelper.deleteProduct(id);
  bool existProductInLikes(int id) => _hiveHelper.existProduct(id);
  List<ProductDetailModel> getAllLikedProducts() => _hiveHelper.getAllProduct();
}