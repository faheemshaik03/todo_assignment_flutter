import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/task_model.dart';

class TaskController extends GetxController {
  final RxList<TaskModel> taskList = <TaskModel>[].obs;
  late Box<TaskModel> taskBox;

  final RxString searchText = ''.obs;
  final RxInt sortOption = 0.obs; // 0: Created, 1: Priority, 2: Due Date

  @override
  void onInit() {
    super.onInit();
    taskBox = Hive.box<TaskModel>('tasks');
    loadTasks();
  }

  void loadTasks() {
    taskList.assignAll(taskBox.values.toList());
    applySorting();
  }

  void addTask(TaskModel task) {
    taskBox.add(task);
    loadTasks();
  }

  void updateTask(int index, TaskModel updatedTask) {
    taskBox.putAt(index, updatedTask);
    loadTasks();
  }

  void deleteTask(int index) {
    taskBox.deleteAt(index);
    loadTasks();
  }

  void applySorting() {
    switch (sortOption.value) {
      case 1:
        taskList.sort((a, b) => a.priority.compareTo(b.priority));
        break;
      case 2:
        taskList.sort((a, b) => a.dueDate.compareTo(b.dueDate));
        break;
      default:
        taskList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }
    taskList.refresh();
  }

  List<TaskModel> get filteredTasks {
    if (searchText.isEmpty) return taskList;
    return taskList.where((task) =>
      task.title.toLowerCase().contains(searchText.value.toLowerCase()) ||
      task.description.toLowerCase().contains(searchText.value.toLowerCase())
    ).toList();
  }

  void updateSearch(String text) {
    searchText.value = text;
  }

  void updateSort(int option) {
    sortOption.value = option;
    applySorting();
  }
}
