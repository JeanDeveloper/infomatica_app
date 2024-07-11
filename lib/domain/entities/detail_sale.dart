import 'package:infomatica_app/domain/entities/product.dart';

class DetailSale {
  int id;
  int orderId;
  int productId;
  Product product;
  int quantity;

  DetailSale({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.product,
    required this.quantity,
  });

}