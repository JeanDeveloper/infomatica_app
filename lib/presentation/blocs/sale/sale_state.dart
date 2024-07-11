part of 'sale_bloc.dart';

@immutable
sealed class SaleState {}

final class SaleInitial extends SaleState {}

class SaleListLoading extends SaleState{}

class SaleListLoaded extends SaleState{
  final List<Sale> sales;
  SaleListLoaded(this.sales);
}

class SaleListError extends SaleState{
  final String message;
  SaleListError(this.message);
}


class SaleCreated extends SaleState {}

class SaleCreationError extends SaleState {
  final String error;

  SaleCreationError(this.error);
}