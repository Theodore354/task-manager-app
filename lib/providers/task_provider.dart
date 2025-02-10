import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = []; 

  // Getter to expose tasks outside the class
  List<Task> get tasks => _tasks;

  
  void addTask(String title, String description) {
    final newTask = Task(
      title: title,
      description: description,
    );
    _tasks.add(newTask);

    
    if (kDebugMode) {
      print('Task Added: ${newTask.title}');
    }
    for (var task in _tasks) {
      if (kDebugMode) {
        print(
          'Task: ${task.title}, ${task.description}, Completed: ${task.isCompleted}');
      }
    }

    notifyListeners(); 
  }

  
  void deleteTask(int index) {
    final deletedTask = _tasks[index];
    _tasks.removeAt(index);

    
    if (kDebugMode) {
      print('Task Deleted: ${deletedTask.title}');
    }

    notifyListeners();
  }

  
  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;

    
    if (kDebugMode) {
      print(
        'Task Updated: ${_tasks[index].title}, Completed: ${_tasks[index].isCompleted}');
    }

    notifyListeners();
  }
}
