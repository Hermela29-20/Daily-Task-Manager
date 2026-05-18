import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  final Task? task;
  const AddTaskScreen({super.key, this.task});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controller = TextEditingController();
  bool loading = false;

  void addTask() async {
    if (_controller.text.isEmpty) return;

    setState(() {
      loading = true;
    });

    await Provider.of<TaskProvider>(
      context,
      listen: false,
    ).addTask(_controller.text);

    setState(() {
      loading = false;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Task Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            loading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: addTask,
                      child: const Text("Add Task"),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
