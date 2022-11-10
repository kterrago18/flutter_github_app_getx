import 'package:flutter_github_app_getx/data/repositories/user_repository_impl.dart';
import 'package:flutter_github_app_getx/domain/usecases/user/get_user_details_usecase.dart';
import 'package:get/instance_manager.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetUserProfileUseCase>(() =>
        GetUserProfileUseCase(iUserRepository: Get.find<UserRepositoryImpl>()));
    Get.lazyPut<UserProfileController>(() => UserProfileController(
        getUserProfileUseCase: Get.find<GetUserProfileUseCase>()));
  }
}
