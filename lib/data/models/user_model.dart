import 'package:infomatica_app/domain/entities/user.dart';

class UserModel extends User{

  UserModel({required super.id, required super.name, required super.username, required super.password});

  factory UserModel.fromJson(json){
    return UserModel(
      id:json['id'], 
      name: json['name'], 
      username: json['username'],
      password: json['password']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'name': name,
      'username': username,
      'password': password
    };
  }

  factory UserModel.fromEntity(User user){
    return UserModel(
      id: user.id,
      name: user.name,
      username: user.username,
      password: user.password
    );
  }

}