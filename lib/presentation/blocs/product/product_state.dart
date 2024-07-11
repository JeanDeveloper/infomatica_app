part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductListLoading extends ProductState{}

class ProductListLoaded extends ProductState{
  final List<Product> products;
  ProductListLoaded(this.products);
}

class ProductListError extends ProductState{
  final String message;
  ProductListError(this.message);
}