import 'package:flutter_github_app_getx/data/repositories/use_repository_impl.dart';
import 'package:flutter_github_app_getx/domain/usecases/user/get_users_usecase.dart';
import 'package:flutter_github_app_getx/presentation/controllers/user_controller.dart';
import 'package:get/instance_manager.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetUsersUsecase(iUserRepository: Get.find<UserRepositoryImpl>()));
    Get.lazyPut(() => UserController(getUsersUsecase: Get.find<GetUsersUsecase>()));
  }
}