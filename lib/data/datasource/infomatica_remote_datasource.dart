import 'package:dio/dio.dart';
import 'package:infomatica_app/core/utils/constants.dart';
import 'package:infomatica_app/data/models/category_model.dart';
import 'package:infomatica_app/data/models/product_model.dart';
import 'package:infomatica_app/data/models/sale_model.dart';
import 'package:infomatica_app/data/models/subcategory_model.dart';
import 'package:infomatica_app/data/models/user_model.dart';
import 'package:infomatica_app/domain/entities/category.dart';
import 'package:infomatica_app/domain/entities/product.dart';


abstract class InfomaticaRemoteDatasource{

  Future<UserModel> login(String username, String password);

  //Orders
  Future<List<SaleModel>> getSales();
  Future<bool> registerSale(List<Product> products);

  //Products
  Future<List<ProductModel>> getProducts();

  //SubCategory
  Future<List<SubCategoryModel>> getSubCategories();

  //Category
  Future<List<CategoryModel>> getCategories();
  Future<bool> registerCategory(Category category);
  Future<bool> deleteCategory(int id);

}


class InfomaticaRemoteDatasourceImpl implements InfomaticaRemoteDatasource{

  final Dio dio = Dio();

  @override
  Future<UserModel> login(String username, String password) async {
    final resp = await dio.post('${Constants.pathApi}auth/login', data: {
      "username": username,
      "password": password
    });
    return UserModel.fromJson(resp.data);
  }

  //Orders
  @override
  Future<List<SaleModel>> getSales() async {
    final Response resp = await dio.get('${Constants.pathApi}Order');
    List<dynamic> json = resp.data as List<dynamic>;
    final resp1 = saleModelFromJson(json);
    return resp1;
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final Response resp = await dio.get('${Constants.pathApi}Product');
    List<dynamic> json = resp.data as List<dynamic>;
    final resp1 = productModelFromJson(json);
    return resp1;
  }

  @override
  Future<bool> registerSale(List<Product> products) async {
    final Response resp = await dio.post('${Constants.pathApi}Order', data: {
      "detailsOrder": products.map((p) => {
        "ProductId": p.id,
        "Quantity": 1
      }).toList(),
    });
    if(resp.statusCode == 201){
      return true;
    }else {
      return false;
    }
  }

  @override
  Future<List<SubCategoryModel>> getSubCategories() async {
    final Response resp = await dio.get('${Constants.pathApi}SubCategory');
    List<dynamic> json = resp.data as List<dynamic>;
    final resp1 = subCategoryModelFromJson(json);
    return resp1;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final Response resp = await dio.get('${Constants.pathApi}Category');
    List<dynamic> json = resp.data as List<dynamic>;
    final resp1 = categoryModelFromJson(json);
    return resp1;
  }
  
  @override
  Future<bool> registerCategory(Category category) async {
    final Response resp = await dio.post(
      '${Constants.pathApi}Category', 
      data: {
        "Name": category.name,
      }
    );

    if(resp.statusCode == 201){
      return true;
    }else {
      return false;
    }
  }

  @override
  Future<bool> deleteCategory(int id) async {
    final Response resp = await dio.post(
      '${Constants.pathApi}Category/delete', 
      data: {
        "id": id,
      }
    );
    if(resp.statusCode == 200){
      return true;
    }else {
      return false;
    }
  }

}