part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class InitialEvent extends CategoryEvent {}

class AddCategory extends CategoryEvent {
  final String name;

  AddCategory(this.name);
}

class DeleteCategory extends CategoryEvent {
  final int id;
  DeleteCategory(this.id);
}
