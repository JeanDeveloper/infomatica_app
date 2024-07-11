part of 'subcategory_bloc.dart';

@immutable
sealed class SubcategoryState {}

final class SubcategoryInitial extends SubcategoryState {}

class SubCategoryListLoading extends SubcategoryState{}

class SubCategoryListLoaded extends SubcategoryState{
  final List<SubCategory> subCategories;
  SubCategoryListLoaded(this.subCategories);
}

class SubCategoryListError extends SubcategoryState{
  final String message;
  SubCategoryListError(this.message);
}