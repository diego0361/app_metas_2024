import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infra/models/task_model.dart';
import '../../infra/repositories/add_task_repository.dart';
import '../../shared/loader_manager.dart';
import '../add_task/add_task_controller.dart';

class MyHomeController extends GetxController with LoaderManager {
  final AddTaskRepository addTaskRepository;
  late final AddTaskController addTaskController =
      AddTaskController(addTaskRepository);
  final RxList<TaskModel> tasks = <TaskModel>[].obs;

  MyHomeController(this.addTaskRepository);

  void navigateToEditTask(TaskModel task) {
    Get.find<MyHomeController>().addTaskController.titleController.text =
        task.title ?? '';
    Get.find<MyHomeController>().addTaskController.descriptionController.text =
        task.description ?? '';
    Get.find<MyHomeController>().addTaskController.deadlineController.text =
        task.deadline?.toLocal().toString() ?? '';
    Get.find<MyHomeController>()
        .addTaskController
        .orderOfImportanceController
        .text = task.orderOfImportance?.toString() ?? '';
    Get.find<MyHomeController>()
        .addTaskController
        .priorityOrderController
        .text = task.priorityOrder?.toString() ?? '';

    Get.find<MyHomeController>().addOrUpdateTask();
  }

  @override
  void onInit() {
    super.onInit();
    addTaskController;

    loadTasks();
    update();
  }

  Future<void> loadTasks() async {
    addTaskController.tasks.value = await addTaskRepository.getTasks();
  }

  Future<void> addOrUpdateTask() async {
    try {
      await addTaskController.addTask();

      // Recarregar as tarefas após adicionar ou editar
      await loadTasks();
    } catch (e) {
      debugPrint('Erro ao adicionar/atualizar a tarefa: $e');
    }
  }

  Future<void> updateTask(TaskModel task) async {
    try {
      await addTaskRepository.updateTask(task);

      await loadTasks();
    } catch (e) {
      debugPrint('Erro ao atualizar a tarefa: $e');
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
