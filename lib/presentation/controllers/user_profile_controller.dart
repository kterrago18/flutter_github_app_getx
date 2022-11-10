import 'package:flutter_github_app_getx/data/models/user_model.dart';
import 'package:flutter_github_app_getx/domain/usecases/user/get_user_details_usecase.dart';
import 'package:get/state_manager.dart';

import '../../core/enums/enums.dart';
import '../../core/mixins/app_status_mixin.dart';

class UserProfileController extends GetxController with AppStatusMixin {
  final GetUserProfileUseCase? _getUserProfileUseCase;

  UserProfileController({
    GetUserProfileUseCase? getUserProfileUseCase,
  }) : _getUserProfileUseCase = getUserProfileUseCase;

  var userDetails = UserModel().obs;


  void loadUser(String login) async {
    appStatus(AppStatus.busy);
    try {
      UserModel? response = await _getUserProfileUseCase!.call(login);
      if (response != null) {
        userDetails(response);
        appStatus(AppStatus.idle);
      } else {
        appStatus(AppStatus.failed);
      }
    } catch (e) {
      appStatus(AppStatus.error);
    }
  }
}
