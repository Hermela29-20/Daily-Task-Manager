import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/api_service.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  bool loading = false;
  String error = '';

  Future<void> fetchTasks() async {
    loading = true;
    notifyListeners();

    try {
      tasks = await ApiService.fetchTasks();
      error = '';
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    final newTask = Task(title: title);

    try {
      final task = await ApiService.addTask(newTask);
      tasks.add(task);
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await ApiService.deleteTask(id);

      tasks.removeWhere((task) => task.id == id);

      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
