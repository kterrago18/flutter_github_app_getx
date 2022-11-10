import 'package:flutter_github_app_getx/data/models/user_model.dart';

abstract class IUserRepository {
  Future<UserModel?> getUserProfile(String login);
  Future<List<UserModel>> getUsers();
}
