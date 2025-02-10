import 'package:flutter/material.dart';
import '../screens/edit_task_screen.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final VoidCallback onDelete;
  final VoidCallback onToggleComplete;
  final int taskIndex;

  const TaskCard({
    required this.title,
    required this.description,
    required this.onDelete,
    required this.onToggleComplete,
    required this.isCompleted,
    required this.taskIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Checkbox(
              value: isCompleted,
              onChanged: (value) => onToggleComplete(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(description),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTaskScreen(
                      taskIndex: taskIndex,
                      currentTitle: title,
                      currentDescription: description,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
