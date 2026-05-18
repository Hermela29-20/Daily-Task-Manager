import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/api_service.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  bool loading = false;
  String error = '';

  // READ
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

  // CREATE (
  Future<void> addTask(String title) async {
    try {
      final newTask = Task(title: title);

      final createdTask = await ApiService.addTask(newTask);

      tasks.insert(0, createdTask); // add at top
      error = '';
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  //UPDATE
  Future<void> updateTask(Task updatedTask) async {
    try {
      final taskFromServer = await ApiService.updateTask(updatedTask);

      final index = tasks.indexWhere((t) => t.id == taskFromServer.id);

      if (index != -1) {
        tasks[index] = taskFromServer;
      }

      error = '';
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  // DELETE
  Future<void> deleteTask(int id) async {
    try {
      await ApiService.deleteTask(id);

      tasks.removeWhere((task) => task.id == id);

      error = '';
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  void clearError() {
    error = '';
    notifyListeners();
  }
}
