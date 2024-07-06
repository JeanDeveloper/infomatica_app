part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

class ChangeTabEvent extends MainEvent {
  int currentIndex = 0;

  ChangeTabEvent(this.currentIndex);
}
