part of 'products_with_category_bloc.dart';

@immutable
abstract class ProductsWithCategoryEvent {}

class InitProducts extends ProductsWithCategoryEvent {
  String category;

  InitProducts(this.category);
}

class ChangeProductsShowing extends ProductsWithCategoryEvent {}

class AddPage extends ProductsWithCategoryEvent {}