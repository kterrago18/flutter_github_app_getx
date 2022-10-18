import 'package:flutter_github_app_getx/domain/repositories/user_repository.dart';
import 'package:flutter_github_app_getx/presentation/base/use_case_no_param.dart';

class GetUsersUsecase implements UseCaseNoParam {
  final IUserRepository iUserRepository;

  GetUsersUsecase({required this.iUserRepository});
  @override
  Future call() async {
    return await iUserRepository.getUsers();
  }
}
