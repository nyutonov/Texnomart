part of 'bottom_navigation_bloc.dart';

class BottomNavigationState {
  int? pageIndex;

  BottomNavigationState({this.pageIndex});

  BottomNavigationState copyWith({
    int? pageIndex
  }) => BottomNavigationState(
    pageIndex: pageIndex ?? this.pageIndex
  );
}