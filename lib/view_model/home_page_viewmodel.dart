import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_app/model/home_model.dart';
import 'package:to_do_app/utils/components/dialog_box_widget.dart';
import 'package:to_do_app/view/settings_view.dart';
import 'package:to_do_app/view/to_do_disc_view.dart';
import 'package:to_do_app/view_model/service/firebase_tasks_service.dart';

class HomePageViewmodel extends ChangeNotifier {
  Map? _selectedTodo;
  Map? get selectedTodo => _selectedTodo;

  TasksService _tasksService = TasksService();

  TextEditingController emojiController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController taskController = TextEditingController();

  void navigateSetting(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SettingsView()));
  }

  void navigateDisc(BuildContext context, Map value) {
    setSelectedTodo(value);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ToDoDiscView()));
  }

  void popFunction(BuildContext context) {
    Navigator.pop(context);
  }

  void setSelectedTodo(Map value) {
    _selectedTodo = value;
  }

  void addTodo(BuildContext context) {
    Map<String, dynamic> payload = HomeModel(
        title: titleController.text.trim(),
        emoji: emojiController.text.trim(),
        tasks: [
          {
            "date": "26/01/2025",
            "dateTask": [
              {"isCompleted": false, "task": taskController.text.trim()},
            ]
          }
        ]).toMap();
    log(taskController.text.trim());
    _tasksService.addTodo(payload);
    popFunction(context);
    
  }



  void floatButtonFunction(BuildContext context) {
    taskController.clear();
    taskDialog(context);
  }

  void addButtonFunction(BuildContext context) {
    taskController.clear();
    homeDialog(context);
  }
}
