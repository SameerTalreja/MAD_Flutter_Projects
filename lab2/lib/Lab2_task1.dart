import 'dart:io';

List<String> tasks = [];

void main() {
  while (true) {
    print("\nTo-Do List:");
    print("1. Add a task");
    print("2. View tasks");
    print("3. Remove a task");
    print("4. Exit");
    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addTask();
        break;
      case '2':
        viewTasks();
        break;
      case '3':
        removeTask();
        break;
      case '4':
        print("Exiting...");
        return;
      default:
        print("Invalid option. Please try again.");
    }
  }
}

void addTask() {
  List<String> newTasks = [];
  while (true) {
    stdout.write("Enter a task  ");
    String? task = stdin.readLineSync();
    if (task != null && task.isNotEmpty) {
      if (task.toLowerCase() == 'done') {
        break;
      }
      newTasks.add(task);
      print("Task added.");
    } else {
      print("Task cannot be empty.");
    }
  }
  tasks.addAll(newTasks);
}

void viewTasks() {
  if (tasks.isEmpty) {
    print("No tasks available.");
  } else {
    print("\nYour Tasks:");
    for (int i = 0; i < tasks.length; i++) {
      print("${i + 1}. ${tasks[i]}");
    }
  }
}

void removeTask() {
  viewTasks();
  if (tasks.isEmpty) return;
  stdout.write("Enter the task number to remove: ");
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '');
  if (index != null && index > 0 && index <= tasks.length) {
    print("Task '${tasks[index - 1]}' removed.");
    tasks.removeAt(index - 1);
  } else {
    print("Invalid task number.");
  }
}
