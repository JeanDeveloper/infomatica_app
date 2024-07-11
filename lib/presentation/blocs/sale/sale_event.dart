part of 'sale_bloc.dart';

@immutable
sealed class SaleEvent {}


class InitialEvent extends SaleEvent{}


class CreateSaleEvent extends SaleEvent {
  final List<Product> selectedProducts;

  CreateSaleEvent(this.selectedProducts);
}