part of 'main_bloc.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class ChangingIndex extends MainState {}

final class ChangedIndex extends MainState {
  final int currentIndex;
  ChangedIndex({required this.currentIndex});
}
