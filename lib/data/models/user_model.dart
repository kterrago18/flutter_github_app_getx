import 'dart:convert';

import 'package:flutter_github_app_getx/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    super.name,
    super.avatarUrl,
    super.followers,
    super.following,
    super.login,
    super.publicRepos,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
      followers: map['followers']?.toInt() ?? 0,
      following: map['following']?.toInt() ?? 0,
      login: map['login'] ?? '',
      publicRepos: map['public_repos']?.toInt() ?? 0,
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
