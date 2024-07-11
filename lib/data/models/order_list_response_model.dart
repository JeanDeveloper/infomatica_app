// // To parse this JSON data, do
// //
// //     final orderListResponse = orderListResponseFromJson(jsonString);

// import 'dart:convert';

// import 'package:infomatica_app/domain/entities/category.dart';

// OrderListResponse orderListResponseFromJson(String str) => OrderListResponse.fromJson(json.decode(str));

// String orderListResponseToJson(OrderListResponse data) => json.encode(data.toJson());

// class OrderListResponse {
//   String id;
//   List<Sale> values;

//   OrderListResponse({
//     required this.id,
//     required this.values,
//   });

//   factory OrderListResponse.fromJson(Map<String, dynamic> json) => OrderListResponse(
//     id: json["\u0024id"],
//     values: List<Sale>.from(json["\u0024values"].map((x) => Sale.fromJson(x))),
//   );

//   Map<String, dynamic> toJson() => {
//     "\u0024id": id,
//     "\u0024values": List<dynamic>.from(values.map((x) => x.toJson())),
//   };

// }

// class Sale {
//   String id;
//   int valueId;
//   DateTime fecha;
//   DetailsOrder detailsOrder;

//   Sale({
//     required this.id,
//     required this.valueId,
//     required this.fecha,
//     required this.detailsOrder,
//   });

//   factory Sale.fromJson(Map<String, dynamic> json) => Sale(
//     id: json["\u0024id"],
//     valueId: json["id"],
//     fecha: DateTime.parse(json["fecha"]),
//     detailsOrder: DetailsOrder.fromJson(json["detailsOrder"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "\u0024id": id,
//     "id": valueId,
//     "fecha": fecha.toIso8601String(),
//     "detailsOrder": detailsOrder.toJson(),
//   };
// }

// class DetailsOrder {
//   String id;
//   List<DetailsOrderValue> values;

//   DetailsOrder({
//     required this.id,
//     required this.values,
//   });

//   factory DetailsOrder.fromJson(Map<String, dynamic> json) => DetailsOrder(
//     id: json["\u0024id"],
//     values: List<DetailsOrderValue>.from(json["\u0024values"].map((x) => DetailsOrderValue.fromJson(x))),
//   );

//   Map<String, dynamic> toJson() => {
//     "\u0024id": id,
//     "\u0024values": List<dynamic>.from(values.map((x) => x.toJson())),
//   };
// }

// class DetailsOrderValue {
//   String id;
//   int valueId;
//   int orderId;
//   Order order;
//   int productId;
//   Product product;
//   int quantity;

//   DetailsOrderValue({
//     required this.id,
//     required this.valueId,
//     required this.orderId,
//     required this.order,
//     required this.productId,
//     required this.product,
//     required this.quantity,
//   });

//   factory DetailsOrderValue.fromJson(Map<String, dynamic> json) => DetailsOrderValue(
//     id: json["\u0024id"],
//     valueId: json["id"],
//     orderId: json["orderId"],
//     order: Order.fromJson(json["order"]),
//     productId: json["productId"],
//     product: Product.fromJson(json["product"]),
//     quantity: json["quantity"],
//   );

//   Map<String, dynamic> toJson() => {
//     "\u0024id": id,
//     "id": valueId,
//     "orderId": orderId,
//     "order": order.toJson(),
//     "productId": productId,
//     "product": product.toJson(),
//     "quantity": quantity,
//   };
// }

// class Order {
//   String ref;

//   Order({
//     required this.ref,
//   });

//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//     ref: json["\u0024ref"],
//   );

//   Map<String, dynamic> toJson() => {
//     "\u0024ref": ref,
//   };
// }

// class Product {
//   String id;
//   int? productId;
//   String name;
//   String description;
//   double price;
//   int? categoryId;
//   Category? category;

//   Product({
//     required this.id,
//     this.productId,
//     required this.name,
//     required this.description,
//     required this.price,
//     this.categoryId,
//     this.category,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json["\u0024id"],
//     productId: json["id"],
//     name: json["name"],
//     description: json["description"],
//     price: json["price"]?.toDouble(),
//     categoryId: json["categoryId"],
//     category: json["category"],
//   );

//   Map<String, dynamic> toJson() => {
//     "\u0024id": id,
//     "id": productId,
//     "name": name,
//     "description": description,
//     "price": price,
//     "categoryId": categoryId,
//     "category": category,
//   };
// }
