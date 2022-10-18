import 'package:http/http.dart' as http;

import 'package:flutter_github_app_getx/core/config/app_constant.dart';

abstract class IUserClient {
  Future<http.Response> getUserDetails(String login);
  Future<http.Response> getUsers();
}

class UserClientImpl implements IUserClient {
  @override
  Future<http.Response> getUserDetails(String login) async {
    final uriParse = Uri.parse('${AppConstant.apiBaseUrl}/users/$login');

    final response = await http.get(uriParse);

    return response;
  }

  @override
  Future<http.Response> getUsers() async {
    final uriParse = Uri.parse('${AppConstant.apiBaseUrl}/users');

    final response = await http.get(uriParse);

    return response;
  }
}
