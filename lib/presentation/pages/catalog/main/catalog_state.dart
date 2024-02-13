part of 'catalog_bloc.dart';

class CatalogState {
  AllCategoryModel? allCategories;
  Status? status;

  CatalogState({this.allCategories, this.status});

  CatalogState copyWith({
    AllCategoryModel? allCategories,
    Status? status
  }) => CatalogState(
    allCategories: allCategories ?? this.allCategories,
    status: status ?? this.status
  );
}