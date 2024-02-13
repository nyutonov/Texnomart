part of 'products_with_category_bloc.dart';

class ProductsWithCategoryState {
  ProductsCategory? products;
  ChipsModel? chips;
  bool? isGrid;
  int? currentPage;
  String? category;
  Status? status;
  Status? statusBottom;

  ProductsWithCategoryState({
    this.products,
    this.chips,
    this.status,
    this.currentPage,
    this.category,
    this.statusBottom,
    this.isGrid
  });

  ProductsWithCategoryState copyWith({
    ProductsCategory? products,
    Status? status,
    bool? isGrid,
    int? currentPage,
    String? category,
    Status? statusBottom,
    ChipsModel? chips
  }) => ProductsWithCategoryState(
    products: products ?? this.products,
    status: status ?? this.status,
    chips: chips ?? this.chips,
    currentPage: currentPage ?? this.currentPage,
    category: category ?? this.category,
    statusBottom: statusBottom ?? this.statusBottom,
    isGrid: isGrid ?? this.isGrid
  );
}