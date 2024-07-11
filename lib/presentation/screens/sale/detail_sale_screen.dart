import 'package:flutter/material.dart';
import 'package:infomatica_app/domain/entities/sale.dart';


class DetailSaleScreen extends StatelessWidget {

  final Sale sale;
  const DetailSaleScreen({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(title: const Text("Listado de Productos"),),
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: sale.detailSale.length,
          itemBuilder: (context, index) {
            final detail = sale.detailSale[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: Text("${detail.id}"),
                  title: Text(detail.product.name),
                  subtitle: Text(detail.product.description),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}