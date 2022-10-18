import 'package:flutter_github_app_getx/data/models/user_model.dart';
import 'package:flutter_github_app_getx/domain/usecases/user/get_user__details_usecase.dart';
import 'package:flutter_github_app_getx/domain/usecases/user/get_users_usecase.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController with StateMixin<UserController> {
  final GetUserDetailsUseCase? _getUserDetailsUseCase;
  final GetUsersUsecase? _getUsersUsecase;

  UserController(
      { GetUserDetailsUseCase? getUserDetailsUseCase,
       GetUsersUsecase? getUsersUsecase})
      : _getUserDetailsUseCase = getUserDetailsUseCase,
        _getUsersUsecase = getUsersUsecase;

  var userDetails = UserModel().obs;

  final users = <UserModel>[].obs;

  void loadUser(String login) async {
    change(state, status: RxStatus.loading());

    userDetails = await _getUserDetailsUseCase?.call(login);

    change(state, status: RxStatus.success());
  }

  void loadUsers() async {
    change(state, status: RxStatus.loading());

    users.value = await _getUsersUsecase?.call();

    change(state, status: RxStatus.success());
  }
}
