part of 'bottom_navigation_bloc.dart';

@immutable
abstract class BottomNavigationEvent {}

class ChangePage extends BottomNavigationEvent {
  int index;

  ChangePage(this.index);
}