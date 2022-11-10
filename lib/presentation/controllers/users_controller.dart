import 'package:flutter_github_app_getx/data/models/user_model.dart';
import 'package:flutter_github_app_getx/domain/usecases/user/get_users_usecase.dart';
import 'package:get/state_manager.dart';

import '../../core/enums/enums.dart';
import '../../core/mixins/app_status_mixin.dart';

class UsersController extends GetxController with AppStatusMixin {
  final GetUsersUsecase? _getUsersUsecase;

  UsersController({GetUsersUsecase? getUsersUsecase})
      : _getUsersUsecase = getUsersUsecase;

  var users = <UserModel>[].obs;

  void loadUsers() async {
    appStatus(AppStatus.busy);
    try {
      List<UserModel> usersResponse = await _getUsersUsecase!.call();

      if (usersResponse.isNotEmpty) {
        users.assignAll(usersResponse);
        appStatus(AppStatus.idle);
      } else {
        appStatus(AppStatus.failed);
      }
    } catch (e) {
      appStatus(AppStatus.error);
    }
  }
}
