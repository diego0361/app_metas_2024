import 'package:flutter/material.dart';

import '../../../infra/models/task_model.dart';
import '../../add_task/add_task_controller.dart';

class CartaoTarefa extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onTap;
  final VoidCallback onPressedDelete;
  final AddTaskController? controller;

  const CartaoTarefa({
    Key? key,
    required this.task,
    this.onTap,
    this.controller,
    required this.onPressedDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.edit),
          ),
          Column(
            children: [
              Text(
                task.title ?? '',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                task.description ?? '',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
    );
  }
}
