import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:texnomart_demo/domain/app_repository.dart';

import '../../../../data/model/all_category/all_category.dart';
import '../../../../utils/status.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final appRepository = AppRepository();

  CatalogBloc() : super(CatalogState()) {
    on<Init>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.LOADING));

        final data = await appRepository.getAllCategories();

        emit(state.copyWith(allCategories: data, status: Status.SUCCESS));
      } catch (e) {
        emit(state.copyWith(status: Status.ERROR));
      }
    });
  }
}
