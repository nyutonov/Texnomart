part of 'product_detail_bloc.dart';

class ProductDetailState {
  ProductDetailModel? details;
  bool? isLike;
  Status? status;

  ProductDetailState({
    this.details,
    this.status,
    this.isLike
  });

  ProductDetailState copyWith({
    ProductDetailModel? details,
    Status? status,
    bool? isLike
  }) {
    return ProductDetailState(
        details: details ?? this.details,
        status: status ?? this.status,
        isLike: isLike ?? this.isLike
    );
  }
}