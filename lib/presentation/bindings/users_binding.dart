import 'package:flutter_github_app_getx/data/repositories/user_repository_impl.dart';
import 'package:flutter_github_app_getx/domain/usecases/user/get_users_usecase.dart';
import 'package:flutter_github_app_getx/presentation/controllers/users_controller.dart';
import 'package:get/instance_manager.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetUsersUsecase>(
        () => GetUsersUsecase(iUserRepository: Get.find<UserRepositoryImpl>()));
    Get.lazyPut<UsersController>(() => UsersController(
          getUsersUsecase: Get.find<GetUsersUsecase>(),
        ));
  }
}
