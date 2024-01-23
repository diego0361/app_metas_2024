import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infra/models/defaults/app_form.dart';
import '../../infra/models/defaults/app_string.dart';
import '../../infra/models/task_model.dart';
import '../../infra/repositories/add_task_repository.dart';
import '../../shared/loader_manager.dart';
import '../home/my_home_controller.dart';

class AddTaskController extends GetxController with LoaderManager {
  final AddTaskRepository addTaskRepository;

  Rx<TaskModel> task = Rx<TaskModel>(TaskModel.fromMap(Get.arguments ?? {}));

  final AppForm appForm = AppForm();

  bool isEditing = false;
  late TaskModel editingTask;

  final RxList<TaskModel> tasks = <TaskModel>[].obs;

  AddTaskController(this.addTaskRepository);

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void clearFields() {
    task.value = TaskModel();
  }

  bool areFieldsValid() {
    return !stringIsNullOrEmpty(task.value.title) &&
        !stringIsNullOrEmpty(task.value.description) &&
        task.value.deadline != null &&
        task.value.orderOfImportance != null &&
        task.value.priorityOrder != null;
  }

  Future<void> loadTasks() async {
    tasks.value = await addTaskRepository.getTasks();
  }

  Future<void> addTask() async {
    if (areFieldsValid()) {
      if (stringIsNullOrEmpty(task.value.id)) {
        await addTaskRepository.addTask(task.value);
      } else {
        await addTaskRepository.updateTask(task.value);
      }

      clearFields();

      Navigator.pop(Get.context!);
      await Get.find<MyHomeController>().loadTasks();
      Get.snackbar(
        'Sucesso',
        "Tarrefa atualizada com sucesso",
        colorText: Colors.green,
      );
    } else {
      Get.snackbar(
        'Erro',
        'Preencha todos os campos obrigatórios.',
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await addTaskRepository.deleteTask(taskId);
    } catch (e) {
      debugPrint('Erro ao excluir a tarefa: $e');
    }
  }
}
