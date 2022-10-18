import 'package:flutter_github_app_getx/data/datasources/user_client.dart';
import 'package:flutter_github_app_getx/data/datasources/user_datasource.dart';
import 'package:flutter_github_app_getx/data/repositories/use_repository_impl.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserClientImpl(), fenix: true);
    Get.lazyPut(() => UserDataSourceImpl(userClientImpl: Get.find<UserClientImpl>()), fenix: true);
    Get.lazyPut(() => UserRepositoryImpl(iUserDataSource: Get.find<UserDataSourceImpl>()), fenix: true);
   
  }
}
