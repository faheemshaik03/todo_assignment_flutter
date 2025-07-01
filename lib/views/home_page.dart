import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/task_controller.dart';
import '../models/task_model.dart';
import 'task_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.put(TaskController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: [
          DropdownButton<int>(
            value: controller.sortOption.value,
            items: const [
              DropdownMenuItem(value: 0, child: Text('Created')),
              DropdownMenuItem(value: 1, child: Text('Priority')),
              DropdownMenuItem(value: 2, child: Text('Due Date')),
            ],
            onChanged: (value) {
              if (value != null) controller.updateSort(value);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: controller.updateSearch,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              final tasks = controller.filteredTasks;
              if (tasks.isEmpty) {
                return const Center(child: Text('No tasks available.'));
              }
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (_, index) {
                  final task = tasks[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      title: Text(task.title),
                      subtitle: Text(
                        '${task.description}\nDue: ${DateFormat.yMd().add_jm().format(task.dueDate)}',
                      ),
                      isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              Get.to(() => TaskFormPage(task: task, index: index));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              controller.deleteTask(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const TaskFormPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
