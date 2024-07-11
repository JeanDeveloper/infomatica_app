import 'package:infomatica_app/domain/entities/product.dart';

class Utils{

  static double calculateTotalPrice(List<Product> products) {
    double total = 0.0;
    for (var product in products) {
      total += product.price;
    }
    return total;
  }

}