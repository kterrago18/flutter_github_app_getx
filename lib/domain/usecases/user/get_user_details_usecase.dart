import 'package:flutter_github_app_getx/data/models/user_model.dart';
import 'package:flutter_github_app_getx/domain/repositories/user_repository.dart';
import 'package:flutter_github_app_getx/presentation/base/use_case.dart';

class GetUserProfileUseCase implements UseCase<String, UserModel?> {
  final IUserRepository iUserRepository;

  GetUserProfileUseCase({required this.iUserRepository});
  
  @override
  Future<UserModel?> call(String param) async {
    return await iUserRepository.getUseDetails(param);
    
  }
}
