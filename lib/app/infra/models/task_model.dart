// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskModel {
  String? id;
  String? title;
  String? description;
  DateTime? deadline;
  DateTime? createAt;
  int? orderOfImportance;
  int? priorityOrder;
  bool? checked;

  TaskModel({
    this.id,
    this.title,
    this.description,
    this.deadline,
    this.createAt,
    this.orderOfImportance,
    this.priorityOrder,
    this.checked,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'deadline': deadline?.millisecondsSinceEpoch,
      'createAt': createAt?.millisecondsSinceEpoch,
      'orderOfImportance': orderOfImportance,
      'priorityOrder': priorityOrder,
      'checked': checked,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      deadline: map['deadline'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['deadline'])
          : DateTime.now(),
      createAt: DateTime.now(),
      orderOfImportance: map['orderOfImportance'] ?? 0,
      priorityOrder: map['priorityOrder'] ?? 0,
      checked: map['checked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
