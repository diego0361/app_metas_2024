import 'package:get/get.dart';
import '../../infra/repositories/add_task_repository.dart';
import 'add_task_controller.dart';

class AddTaskBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddTaskRepository());
    Get.lazyPut(() => AddTaskController(Get.find()));
    Get.put(AddTaskController(Get.find()));
  }
}
