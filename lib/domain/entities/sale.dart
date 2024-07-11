import 'package:infomatica_app/domain/entities/detail_sale.dart';

class Sale {
    int id;
    DateTime fecha;
    List<DetailSale> detailSale;

    Sale({
        required this.id,
        required this.fecha,
        required this.detailSale,
    });

}