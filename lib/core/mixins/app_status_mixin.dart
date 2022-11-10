import 'package:get/state_manager.dart';

import '../enums/enums.dart';

mixin AppStatusMixin on GetxController {
  var appStatus = AppStatus.idle.obs;
}