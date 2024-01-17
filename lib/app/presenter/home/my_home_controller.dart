import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infra/models/task_model.dart';
import '../../infra/repositories/add_task_repository.dart';
import '../../shared/loader_manager.dart';

class MyHomeController extends GetxController with LoaderManager {
  final AddTaskRepository addTaskRepository;
  final RxList<TaskModel> tasks = <TaskModel>[].obs;

  MyHomeController(this.addTaskRepository);

  @override
  void onInit() {
    super.onInit();
    loadTasks();
    update();
  }

  void updateTaskStatus(TaskModel task) {
    task.checked = !task.checked!;
    update();
  }

  Future<void> loadTasks() async {
    try {
      tasks.value = await addTaskRepository.getTasks();
    } catch (e) {
      debugPrint('Erro ao carregar as tarefas: $e');
    }
  }

  Future<void> deleteTask(String? taskId) async {
    try {
      await addTaskRepository.deleteTask(taskId!);

      await Get.find<MyHomeController>().loadTasks();
      await loadTasks();
      update();
    } catch (e) {
      debugPrint('Erro ao excluir a tarefa: $e');
    }
  }
}
