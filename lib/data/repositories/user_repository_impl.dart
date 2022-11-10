import 'package:flutter_github_app_getx/data/datasources/user_datasource.dart';
import 'package:flutter_github_app_getx/domain/repositories/user_repository.dart';

import '../models/user_model.dart';

class UserRepositoryImpl implements IUserRepository {
  final IUserDataSource _iUserDataSource;

  UserRepositoryImpl({required IUserDataSource iUserDataSource}) : _iUserDataSource = iUserDataSource;
  @override
  Future<UserModel?> getUserProfile(String login) async {
    return await _iUserDataSource.getUserDetails(login);
  }

  @override
  Future<List<UserModel>> getUsers() async {
    return await _iUserDataSource.getUsers();
  }
}
