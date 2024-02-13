part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent {}

class DetailInit extends ProductDetailEvent {
  int id;
  ProductDetailModel? product;

  DetailInit({required this.id, this.product});
}

class ClickLike extends ProductDetailEvent {
  int id;

  ClickLike(this.id);
}