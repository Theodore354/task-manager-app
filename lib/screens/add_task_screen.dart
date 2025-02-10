import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';



class AddTaskScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Task Title',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Enter task title',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Task Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Enter task description',
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    if (kDebugMode) {
                      print(
                        'Adding Task: ${titleController.text}, ${descriptionController.text}');
                    }

                    Provider.of<TaskProvider>(context, listen: false).addTask(
                      titleController.text,
                      descriptionController.text,
                    );

                    if (kDebugMode) {
                      print('Task added successfully!');
                    }
                    Navigator.pop(context);
                  } else {
                    if (kDebugMode) {
                      print('Both fields are required!');
                    }
                  }
                },
                child: const Text('Add Task'),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
