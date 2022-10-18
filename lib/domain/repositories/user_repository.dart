import 'package:flutter_github_app_getx/domain/entities/user.dart';

abstract class IUserRepository {
  Future<User?> getUseDetails(String login);
  Future<List<User>> getUsers();
}
