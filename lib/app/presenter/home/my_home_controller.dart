import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeiro_2024/app/infra/models/task_model.dart';
import 'package:primeiro_2024/app/infra/repositories/add_task_repository.dart';
import 'package:primeiro_2024/app/shared/loader_manager.dart';

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

  Future<void> loadTasks() async {
    try {
      tasks.value = await addTaskRepository.getTasks();
    } catch (e) {
      debugPrint('Erro ao carregar as tarefas: $e');
    }
  }

  Future<void> addTask(TaskModel task) async {
    try {
      await addTaskRepository.addTask(task);

      await loadTasks();
    } catch (e) {
      debugPrint('Erro ao adicionar a tarefa: $e');
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

      await loadTasks();
    } catch (e) {
      debugPrint('Erro ao excluir a tarefa: $e');
    }
  }
}
