import 'package:dio/dio.dart';

import '../../../../main.dart';
import '../../../model/all_category/all_category.dart';
import '../../../model/chips/chips_model.dart';
import '../../../model/products_category/products_category.dart';
import '../../../model/parent.dart';
import '../../../model/brand/brand_model.dart';
import '../../../model/category/category_model.dart';
import '../../../model/product/product_model.dart';
import '../../../model/product_detail/product_detail_model.dart';
import '../../../model/slider/slider_model.dart';

class DioService {
  final dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: 'https://gateway.texnomart.uz/',
      sendTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    )
  );

  DioService() {
    dio.interceptors.add(alice.getDioInterceptor());
  }

  Future<List<Parent>> getAll() async {
    try {
      final response = await Future.wait([
        dio.get('api/web/v1/content/sliders'),
        dio.get('api/web/v1/home/special-brands'),
        dio.get('api/web/v1/home/special-categories'),
        dio.get(
            'api/web/v1/home/special-products',
            queryParameters: {
              'type': 'new_products'
            }
        ),
        dio.get(
            'api/web/v1/home/special-products',
            queryParameters: {
              'type': 'hit_products'
            }
        )
      ]);

      return [
        SliderModel.fromJson(response[0].data),
        BrandModel.fromJson(response[1].data),
        CategoryModel.fromJson(response[2].data),
        ProductModel.fromJson(response[3].data),
        ProductModel.fromJson(response[4].data),
      ];
    } catch (e) {
      return [];
    }
  }
  Future<ProductsCategory?> getAllProductsInCategory(String category, int page) async {
    try {
      final response = await dio.get(
          'api/common/v1/search/filters',
          queryParameters: {
            'category': category,
            'sort': 'price',
            'page': page
          }
      );

      return ProductsCategory.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
  Future<ProductDetailModel?> getProductDetails(int id) async {
    try {
      final response = await dio.get(
          'api/web/v1/product/detail',
          queryParameters: {
            'id': id
          }
      );

      return ProductDetailModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
  Future<AllCategoryModel?> getAllCategories() async {
    try {
      final response = await dio.get(
        'api/web/v1/header/popup-menu-catalog'
      );

      return AllCategoryModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
  Future<ChipsModel?> getAllChips(String category) async {
    try {
      final response = await dio.get(
        'api/web/v1/category/chips',
        queryParameters: {
          'slug': category
        }
      );

      return ChipsModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}