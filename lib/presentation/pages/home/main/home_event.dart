part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class Init extends HomeEvent {
  bool isFirstOpen;

  Init(this.isFirstOpen);
}

class ChangeCurrentIndexIndicator extends HomeEvent {
  int index;

  ChangeCurrentIndexIndicator(this.index);
}