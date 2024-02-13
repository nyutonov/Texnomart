import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:texnomart_demo/data/model/product_detail/product_detail_model.dart';

import '../../../domain/app_repository.dart';
import '../../../utils/status.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final appRepository = AppRepository();

  ProductDetailBloc() : super(ProductDetailState()) {
    on<DetailInit>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.LOADING));

        final detailData = await appRepository.getProductDetail(event.id);
        final isLike = appRepository.existProductInLikes(event.id);

        emit(state.copyWith(details: detailData, status: Status.SUCCESS, isLike: isLike));
      } catch (e) {
        emit(state.copyWith(status: Status.ERROR));
      }
    });

    on<ClickLike>((event, emit) async {
      if (state.status == Status.SUCCESS) {
        if (state.isLike == false) {
          appRepository.addProductToLikes(state.details!);

          emit(state.copyWith(isLike: true));
        } else {
          appRepository.deleteProductInLikes(event.id);

          emit(state.copyWith(isLike: false));
        }
      }
    });
  }
}