import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'our_stores_event.dart';
part 'our_stores_state.dart';

class OurStoresBloc extends Bloc<OurStoresEvent, OurStoresState> {
  OurStoresBloc() : super(OurStoresInitial()) {
    on<OurStoresEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
