import 'package:get/get.dart';


import '../data/tasks.dart';
import '../model/TaskModel.dart';

class TaskController extends GetxController {
  final Show = true.obs;
  var tasks = RxList<Task>();
  final selections = <String>[].obs;

  void toggleSelection(String title) {
    if (selections.contains(title)) {
      selections.remove(title);
    } else {
      selections.add(title);
    }
  }

  void ShowDetail() {
    Show.toggle();
    print("toggle");
  }

  @override
  void onInit() {
    fetchItems();
    super.onInit();
  }


  void fetchItems() async {
    try {
     // final List<Task> fetchedItems = await ApiService.fetchItems();
      final List<Task> fetchedItems = ListTasks;
      tasks.addAll(fetchedItems);
    } catch (e) {
      print(e);
    }
  }
}
