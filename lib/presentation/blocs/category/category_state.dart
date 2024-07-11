part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

class CategoryListLoading extends CategoryState{}

class CategoryListLoaded extends CategoryState{
  final List<Category> categories;
  CategoryListLoaded(this.categories);
}

class CategoryListError extends CategoryState{
  final String message;
  CategoryListError(this.message);
}

class CategoryAdded extends CategoryState {}

class CategoryDeleted extends CategoryState {}