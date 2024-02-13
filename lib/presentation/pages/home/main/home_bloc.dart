import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:texnomart_demo/data/model/brand/brand_model.dart';
import 'package:texnomart_demo/data/model/category/category_model.dart';
import 'package:texnomart_demo/data/model/slider/slider_model.dart';
import 'package:texnomart_demo/domain/app_repository.dart';
import 'package:texnomart_demo/utils/status.dart';

import '../../../../data/model/product/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // final appRepository = locator.get<AppRepository>();
  final appRepository = AppRepository();

  HomeBloc() : super(HomeState(currentIndexIndicator: 0, isFirstOpen: true)) {
    on<Init>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.LOADING));

        final allData = await appRepository.getAll();

        emit(state.copyWith(
            isFirstOpen: event.isFirstOpen,
            status: Status.SUCCESS,
            sliders: (allData[0] as SliderModel).data.data,
            brands: (allData[1] as BrandModel).data.data,
            categories: (allData[2] as CategoryModel).data.data,
            newProducts: (allData[3] as ProductModel).data?.data,
            hitProducts: (allData[4] as ProductModel).data?.data
        ));

        // if ((allData[0] as SliderModel).success) {
        //   emit(state.copyWith(
        //     isFirstOpen: event.isFirstOpen,
        //     status: Status.SUCCESS,
        //     sliders: (allData[0] as SliderModel).data.data,
        //     brands: (allData[1] as BrandModel).data.data,
        //     categories: (allData[2] as CategoryModel).data.data,
        //     hitProducts: (allData[3] as ProductModel).data?.data,
        //     newProducts: (allData[4] as ProductModel).data?.data
        //   ));
        // } else {
        //   emit(state.copyWith(
        //     isFirstOpen: event.isFirstOpen,
        //     status: Status.ERROR,
        //   ));
        // }
      } catch(e) {
        emit(state.copyWith(status: Status.ERROR));
      }
    });

    on<ChangeCurrentIndexIndicator>((event, emit) async {
      emit(state.copyWith(currentIndexIndicator: event.index));
    });
  }
}