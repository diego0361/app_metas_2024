import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/app_constants.dart';
import 'core/routes/app_pages.dart';
import 'infra/repositories/add_task_repository.dart';
import 'presenter/add_task/add_task_binding.dart';
import 'presenter/home/my_home_controller.dart';
import 'presenter/home/my_home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyHomeController(AddTaskRepository()));
    return GetMaterialApp(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: MyHomePage.route,
      initialBinding: AddTaskBindings(),
    );
  }
}
