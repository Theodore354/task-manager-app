import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class EditTaskScreen extends StatelessWidget {
  final int taskIndex;
  final String currentTitle;
  final String currentDescription;

  EditTaskScreen({
    required this.taskIndex,
    required this.currentTitle,
    required this.currentDescription,
    super.key,
  });

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = currentTitle;
    descriptionController.text = currentDescription;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Task Title'),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Enter task title',
              ),
            ),
            const SizedBox(height: 16),
            const Text('Task Description'),
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
                    Provider.of<TaskProvider>(context, listen: false).editTask(
                      taskIndex,
                      titleController.text,
                      descriptionController.text,
                    );
                    Navigator.pop(context); // Go back after updating
                  }
                },
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
