import 'package:get/get.dart';


import '../data/tasks.dart';
import '../model/TaskModel.dart';

class ArchiveContoller extends GetxController {

  var tasks = RxList<Task>();





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
