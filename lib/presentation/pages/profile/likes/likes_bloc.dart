import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:texnomart_demo/domain/app_repository.dart';

import '../../../../data/model/product_detail/product_detail_model.dart';
import '../../../../utils/status.dart';

part 'likes_event.dart';
part 'likes_state.dart';

class LikesBloc extends Bloc<LikesEvent, LikesState> {
  final appRepository = AppRepository();

  LikesBloc() : super(LikesState()) {
    on<Init>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.LOADING));

        emit(state.copyWith(likedProducts: appRepository.getAllLikedProducts(), status: Status.SUCCESS));
      } catch (e) {
        emit(state.copyWith(status: Status.ERROR));
      }
    });
  }
}