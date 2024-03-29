import 'package:get/get.dart';
import 'package:primeiro_2024/app/presenter/add_task/add_task_binding.dart';

import '../../presenter/add_task/add_task_page.dart';
import '../../presenter/home/my_home_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: MyHomePage.route,
      page: () => const MyHomePage(),
    ),
    GetPage(
      title: 'Add Tarefas',
      binding: AddTaskBindings(),
      name: AddTaskPage.route,
      page: () => const MyHomePage(),
    )
  ];
}
