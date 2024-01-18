import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask/mask/generic_maks.dart';
import 'package:primeiro_2024/app/infra/models/defaults/app_string.dart';

import '../../core/themes/app_colors.dart';
import '../../shared/custom_form_field.dart';
import 'add_task_controller.dart';

// ignore: must_be_immutable
class AddTaskPage extends GetView<AddTaskController> {
  AddTaskPage({super.key});

  var formatter = DateFormat('dd/MM/yyyy');

  static const route = '/task';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.grey),
        backgroundColor: AppColors.primaryColor.withOpacity(0.9),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: InkWell(
              onTap: () {
                controller.addTask();
              },
              child: const Icon(
                Icons.check,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28, bottom: 18, top: 0),
              child: Text(
                controller.task.value.checked != false
                    ? 'Editar Tarefa'
                    : 'Nova Tarefa',
                style: const TextStyle(
                  fontSize: 24,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            AppTextFormField(
              titleLabel: "Titulo",
              initialValue: controller.task.value.title ?? '',
              onChanged: (String value) {
                controller.task.value.title = value;
              },
            ),
            AppTextFormField(
              titleLabel: "Descrição",
              initialValue: controller.task.value.description ?? '',
              onChanged: (String value) {
                controller.task.value.description = value;
              },
              maxLines: 3,
            ),
            AppTextFormField(
              titleLabel: "Data Limite",
              onChanged: (String value) {
                controller.task.value.deadline = stringToDateTime(value);
              },
              inputFormatters: [
                GenericMask(mask: ["##/##/####"])
              ],
            ),
            AppTextFormField(
              titleLabel: "Ordem de Importância",
              onChanged: (String value) {
                controller.task.value.orderOfImportance = int.tryParse(value);
              },
            ),
            AppTextFormField(
              titleLabel: "Ordem de Prioridade",
              onChanged: (String value) {
                controller.task.value.priorityOrder = int.tryParse(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
