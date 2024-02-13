part of 'home_bloc.dart';

class HomeState {
  bool? isFirstOpen;
  int? currentIndexIndicator;
  List<SliderDatum>? sliders;
  List<BrandDatum>? brands;
  List<CategoryDatum>? categories;
  List<Data>? hitProducts;
  List<Data>? newProducts;
  Status? status;

  HomeState({
    this.isFirstOpen,
    this.currentIndexIndicator,
    this.sliders,
    this.brands,
    this.status,
    this.categories,
    this.hitProducts,
    this.newProducts
  });

  HomeState copyWith({
    bool? isFirstOpen,
    int? currentIndexIndicator,
    List<SliderDatum>? sliders,
    List<BrandDatum>? brands,
    List<CategoryDatum>? categories,
    List<Data>? hitProducts,
    List<Data>? newProducts,
    Status? status
  }) => HomeState(
    isFirstOpen: isFirstOpen ?? this.isFirstOpen,
    currentIndexIndicator: currentIndexIndicator ?? this.currentIndexIndicator,
    sliders: sliders ?? this.sliders,
    brands: brands ?? this.brands,
    categories: categories ?? this.categories,
    hitProducts: hitProducts ?? this.hitProducts,
    newProducts: newProducts ?? this.newProducts,
    status: status ?? this.status
  );
}