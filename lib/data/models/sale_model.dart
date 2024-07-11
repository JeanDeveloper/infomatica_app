
// import 'dart:convert';

import 'package:infomatica_app/data/models/detail_sale_model.dart';
import 'package:infomatica_app/domain/entities/detail_sale.dart';
import 'package:infomatica_app/domain/entities/sale.dart';

// List<SaleModel> saleModelFromJson(String str) => List<SaleModel>.from(json.decode(str).map((x) => SaleModel.fromJson(x)));

List<SaleModel> saleModelFromJson( List<dynamic> jsonList ){
  return jsonList.map(
    (e) => SaleModel.fromJson(e as Map<String, dynamic>),
  ).toList();
}

// String saleModelToJson(List<SaleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SaleModel extends Sale{
  SaleModel({
    required super.id, 
    required super.fecha, 
    required super.detailSale
  });

  factory SaleModel.fromJson(Map<String, dynamic> json) {
    return SaleModel(
    id: json["id"],
    fecha: DateTime.parse(json["fecha"]),
    detailSale: List<DetailSale>.from(json["detailsOrder"].map((x) => DetailSaleModel.fromJson(x))),
  );
  }

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "fecha": fecha.toIso8601String(),
  //   "detailsOrder": List<dynamic>.from(detailsOrder.map((x) => x.toJson())),
  // };

}