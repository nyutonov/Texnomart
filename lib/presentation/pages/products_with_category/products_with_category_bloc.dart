import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:texnomart_demo/data/model/chips/chips_model.dart';
import 'package:texnomart_demo/domain/app_repository.dart';

import '../../../data/model/products_category/products_category.dart';
import '../../../utils/status.dart';

part 'products_with_category_event.dart';
part 'products_with_category_state.dart';

class ProductsWithCategoryBloc extends Bloc<ProductsWithCategoryEvent, ProductsWithCategoryState> {
  final appRepository = AppRepository();

  ProductsWithCategoryBloc() : super(ProductsWithCategoryState(isGrid: true, currentPage: 1)) {
    on<InitProducts>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.LOADING));

        final products = await appRepository.getAllProductsInCategory(event.category, state.currentPage ?? 1);
        final chips = await appRepository.getAllChips(event.category);

        emit(state.copyWith(products: products, category: event.category, chips: chips, status: Status.SUCCESS));
      } catch (e) {
        emit(state.copyWith(status: Status.ERROR));
      }
    });

    on<ChangeProductsShowing>((event, emit) {
      emit(state.copyWith(isGrid: state.isGrid == false));
    });

    on<AddPage>((event, emit) async {
      if (state.currentPage == state.products?.data?.pagination?.totalPage) {
        return;
      }

      try {
        emit(state.copyWith(statusBottom: Status.LOADING));

        final newPage = (state.currentPage ?? 0) + 1;

        final newProduct = await appRepository.getAllProductsInCategory(state.category ?? '', newPage);
        final allProducts = state.products;

        allProducts?.data?.products?.addAll(newProduct?.data?.products ?? []);

        emit(state.copyWith(products: allProducts, currentPage: newPage, statusBottom: Status.SUCCESS));
      } catch (e) {
        emit(state.copyWith(statusBottom: Status.ERROR));
      }
    });
  }
}