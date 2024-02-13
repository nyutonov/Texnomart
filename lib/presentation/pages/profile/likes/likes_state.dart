part of 'likes_bloc.dart';

class LikesState {
  List<ProductDetailModel?>? likedProducts;
  Status? status;

  LikesState({
    this.likedProducts,
    this.status
  });

  LikesState copyWith({
    List<ProductDetailModel?>? likedProducts,
    Status? status
  }) => LikesState(
    likedProducts: likedProducts ?? this.likedProducts,
    status: status ?? this.status
  );
}