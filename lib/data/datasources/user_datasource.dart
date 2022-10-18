import 'dart:convert';

import 'package:flutter_github_app_getx/data/datasources/user_client.dart';
import 'package:flutter_github_app_getx/data/models/user_model.dart';

abstract class IUserDataSource {
  Future<UserModel?> getUserDetails(String login);
  Future<List<UserModel>> getUsers();
}

class UserDataSourceImpl implements IUserDataSource {
  final UserClientImpl _userClientImpl;

  UserDataSourceImpl({required UserClientImpl userClientImpl}) : _userClientImpl = userClientImpl;

  @override
  Future<UserModel?> getUserDetails(String login) async {
    try {
      final response = await _userClientImpl.getUserDetails(login);

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.body);
      }

      return null;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _userClientImpl.getUsers();

      if (response.statusCode == 200) {
        return List<UserModel>.from(json.decode(response.body).map(
            (x) => UserModel.fromMap(x)));
      }
      return [];
    } catch (e) {
      throw Exception();
    }
  }
}
