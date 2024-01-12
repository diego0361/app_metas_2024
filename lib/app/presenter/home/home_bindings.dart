import 'package:get/get.dart';
import 'package:primeiro_2024/app/infra/repositories/add_task_repository.dart';
import 'package:primeiro_2024/app/presenter/home/my_home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AddTaskRepository());
    Get.put(MyHomeController(AddTaskRepository()));
    Get.lazyPut(() => MyHomeController(Get.find()));
    Get.put(MyHomeController(Get.find()));
  }
}
