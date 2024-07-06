import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:infomatica_app/core/utils/constants.dart';
import 'package:infomatica_app/data/models/category_model.dart';
import 'package:infomatica_app/data/models/user_model.dart';

abstract class InfomaticaRemoteDatasource{

  Future<UserModel> login(String username, String password);

  //Categoria
  Future<List<CategoryModel>> getCategoryList();

  Future<CategoryModel> getCategory();

  Future<bool> registerCategory(Category category);


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
  
  @override
  Future<CategoryModel> getCategory() {
    // TODO: implement getCategory
    throw UnimplementedError();
  }
  
  @override
  Future<List<CategoryModel>> getCategoryList() {
    // TODO: implement getCategoryList
    throw UnimplementedError();
  }
  
  @override
  Future<bool> registerCategory(Category category) {
    // TODO: implement registerCategory
    throw UnimplementedError();
  }

}