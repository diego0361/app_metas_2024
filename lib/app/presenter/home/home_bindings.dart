import 'package:get/get.dart';

import '../../infra/repositories/add_task_repository.dart';
import 'my_home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AddTaskRepository());
    Get.put(MyHomeController(AddTaskRepository()));
    Get.lazyPut(() => MyHomeController(Get.find()));
    Get.put(MyHomeController(Get.find()));
  }
}
