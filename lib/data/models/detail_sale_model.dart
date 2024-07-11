import 'package:infomatica_app/data/models/product_model.dart';
import 'package:infomatica_app/domain/entities/detail_sale.dart';

class DetailSaleModel extends DetailSale{
  DetailSaleModel({
    required super.id, 
    required super.orderId, 
    required super.productId, 
    required super.product, 
    required super.quantity
  });

  factory DetailSaleModel.fromJson(Map<String, dynamic> json) => DetailSaleModel(
      id: json["id"],
      orderId: json["orderId"],
      productId: json["productId"],
      product: ProductModel.fromJson(json["product"]),
      quantity: json["quantity"],
  );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "orderId": orderId,
  //     "productId": productId,
  //     "product":    product.toJson(),
  //     "quantity": quantity,
  // };

}
