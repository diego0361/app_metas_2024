import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/task_model.dart';

class AddTaskRepository {
  final CollectionReference _tasksCollection =
      FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask(TaskModel task) async {
    try {
      await _tasksCollection.add(task.toMap());
    } catch (e) {
      debugPrint('Erro ao adicionar a tarefa: $e');
    }
  }

  Future<List<TaskModel>> getTasks() async {
    try {
      var result = await _tasksCollection.get();
      return result.docs
          .map((doc) => TaskModel.fromMap(doc.data() as Map<String, dynamic>)
            ..id = doc.id)
          .toList();
    } catch (e) {
      debugPrint('Erro ao obter as tarefas: $e');
      return [];
    }
  }

  Future<void> updateTask(TaskModel task) async {
    try {
      await _tasksCollection
          .doc(task.id)
          .set(task.toMap(), SetOptions(merge: true));
    } catch (e) {
      debugPrint('Erro ao atualizar a tarefa: $e');
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _tasksCollection.doc(taskId).delete();
    } catch (e) {
      debugPrint('Erro ao excluir a tarefa: $e');
    }
  }
}
