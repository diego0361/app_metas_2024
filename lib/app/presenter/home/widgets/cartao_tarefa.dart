import 'package:flutter/material.dart';

import '../../../infra/models/task_model.dart';
import '../../add_task/add_task_controller.dart';

class CartaoTarefa extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onCheckUpdate;
  final VoidCallback? onUpdate;
  final VoidCallback onPressedDelete;
  final AddTaskController? controller;

  const CartaoTarefa({
    Key? key,
    required this.task,
    this.onCheckUpdate,
    this.onUpdate,
    this.controller,
    required this.onPressedDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onUpdate,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () {
                  if (onCheckUpdate != null) {
                    onCheckUpdate!();
                  }
                },
                child: Icon(
                  task.checked!
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank_rounded,
                  size: 28,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  task.title ?? '',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  task.description ?? '',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: onPressedDelete,
                child: const Icon(
                  Icons.delete,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
