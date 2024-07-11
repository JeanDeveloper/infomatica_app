part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddProductToCart extends CartEvent {
  final Product product;
  AddProductToCart({required this.product});
}

class ClearCart extends CartEvent {}
