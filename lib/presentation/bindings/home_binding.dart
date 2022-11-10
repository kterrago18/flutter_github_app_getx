import 'package:flutter_github_app_getx/data/datasources/user_client.dart';
import 'package:flutter_github_app_getx/data/datasources/user_datasource.dart';
import 'package:flutter_github_app_getx/data/repositories/user_repository_impl.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserClientImpl>(UserClientImpl());
    Get.put<UserDataSourceImpl>((UserDataSourceImpl(userClientImpl: Get.find<UserClientImpl>())));
    Get.put<UserRepositoryImpl>(UserRepositoryImpl(iUserDataSource: Get.find<UserDataSourceImpl>()));
   
  }
}
