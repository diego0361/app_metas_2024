import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infra/models/task_model.dart';
import '../../infra/repositories/add_task_repository.dart';
import '../../shared/loader_manager.dart';
import '../home/my_home_controller.dart';

class AddTaskController extends GetxController with LoaderManager {
  final AddTaskRepository addTaskRepository;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController orderOfImportanceController =
      TextEditingController();
  final TextEditingController priorityOrderController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();

  final RxList<TaskModel> tasks = <TaskModel>[].obs;

  AddTaskController(this.addTaskRepository);

  @override
  void onInit() {
    super.onInit();
    var taskToEdit = Get.arguments as TaskModel?;
    if (taskToEdit != null) {
      titleController.text = taskToEdit.title ?? '';
      descriptionController.text = taskToEdit.description ?? '';
      deadlineController.text = taskToEdit.deadline?.toLocal().toString() ?? '';
      orderOfImportanceController.text =
          taskToEdit.orderOfImportance?.toString() ?? '';
      priorityOrderController.text = taskToEdit.priorityOrder?.toString() ?? '';
    }
    loadTasks();
  }

  Future<void> loadTasks() async {
    tasks.value = await addTaskRepository.getTasks();
  }

  Future<void> addTask() async {
    try {
      String deadlineString = deadlineController.text;
      DateTime? deadline;

      if (RegExp(r'\d{2}/\d{2}/\d{4}').hasMatch(deadlineString)) {
        List<String> parts = deadlineString.split('/');
        deadlineString = '${parts[2]}-${parts[1]}-${parts[0]}';
        deadline = DateTime.tryParse(deadlineString);
      } else {
        return;
      }

      TaskModel task = TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        deadline: deadline,
        createAt: DateTime.now(),
        orderOfImportance: int.parse(orderOfImportanceController.text),
        priorityOrder: int.parse(priorityOrderController.text),
        checked: false,
      );

      if (Get.arguments == null) {
        await addTaskRepository.addTask(task);
      } else {
        task.id = (Get.arguments as TaskModel).id;
        await addTaskRepository.updateTask(task);
      }

      titleController.clear();
      deadlineController.clear();
      descriptionController.clear();
      orderOfImportanceController.clear();
      priorityOrderController.clear();

      Get.back();

      await Get.find<MyHomeController>().loadTasks();
    } catch (e) {
      debugPrint('Erro ao adicionar a tarefa: $e');
    }
  }

  Future<void> updateTask(TaskModel task) async {
    try {
      String deadlineString = deadlineController.text;
      DateTime? deadline;

      if (RegExp(r'\d{2}/\d{2}/\d{4}').hasMatch(deadlineString)) {
        List<String> parts = deadlineString.split('/');
        deadlineString = '${parts[2]}-${parts[1]}-${parts[0]}';
        deadline = DateTime.tryParse(deadlineString);
      } else {
        return;
      }

      task.title = 'Novo Título';
      task.description = 'Nova Descrição';
      task.deadline = deadline;
      task.orderOfImportance = 0;
      task.priorityOrder = 0;

      await addTaskRepository.updateTask(task);

      await loadTasks();
    } catch (e) {
      debugPrint('Erro ao atualizar a tarefa: $e');
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
