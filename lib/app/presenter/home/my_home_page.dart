import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeiro_2024/app/core/themes/app_colors.dart';
import 'package:primeiro_2024/app/presenter/add_task/add_task_page.dart';
import 'package:primeiro_2024/app/presenter/home/my_home_controller.dart';

import 'widgets/cartao_tarefa.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  static const route = '/home';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MyHomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.notifications,
              color: AppColors.grey,
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldDarkColor,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: AppColors.grey),
                      hintText: 'Pesquisar',
                      hintStyle: TextStyle(color: AppColors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              child: const Icon(
                Icons.add_circle_outline_sharp,
                color: AppColors.grey,
              ),
              onTap: () {
                Get.to(
                  () => AddTaskPage(),
                );
              },
            ),
          ],
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: homeController.tasks.length,
          itemBuilder: (context, index) {
            var task = homeController.tasks[index];
            return CartaoTarefa(
              task: task,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
