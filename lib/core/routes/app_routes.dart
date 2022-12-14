import 'package:flutter_github_app_getx/presentation/bindings/home_binding.dart';
import 'package:flutter_github_app_getx/presentation/bindings/user_profile_binding.dart';
import 'package:flutter_github_app_getx/presentation/bindings/users_binding.dart';
import 'package:flutter_github_app_getx/presentation/pages/home_page.dart';
import 'package:flutter_github_app_getx/presentation/pages/repository_page.dart';
import 'package:flutter_github_app_getx/presentation/pages/userprofile_page.dart';
import 'package:flutter_github_app_getx/presentation/pages/users_page.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/home';
  static const String repositories = '/repositories';
  static const String userDetails = '/user-details';
  static const String users = '/users';
}

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      //binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.userDetails,
      page: () => const UserProfilePage(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.users,
      page: () => const UsersPage(),
      binding: UsersBinding(),
    ),
  ];
}
