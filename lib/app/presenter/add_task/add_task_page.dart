import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.grey),
        backgroundColor: AppColors.primaryColor,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Título',
              style: TextStyle(color: AppColors.grey),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: CustomFormField(
              controller: controller.titleController,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Descrição',
              style: TextStyle(color: AppColors.grey),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: CustomFormField(
              controller: controller.descriptionController,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Data limite',
              style: TextStyle(color: AppColors.grey),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );

                if (pickedDate != null) {
                  controller.deadlineController.text =
                      formatter.format(pickedDate);
                }
              },
              child: AbsorbPointer(
                child:
                    CustomFormField(controller: controller.deadlineController),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Ordem de importância',
              style: TextStyle(color: AppColors.grey),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: CustomFormField(
              controller: controller.orderOfImportanceController,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Ordem de prioridade',
              style: TextStyle(color: AppColors.grey),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: CustomFormField(
              controller: controller.priorityOrderController,
            ),
          ),
        ],
      ),
    );
  }
}
