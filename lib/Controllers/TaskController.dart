import 'package:get/get.dart';


import '../data/tasks.dart';
import '../model/TaskModel.dart';

class TaskController extends GetxController {
  final Show = true.obs;
  var tasks = RxList<Task>();
  final selections = <String>[].obs;
  var selectedIndex = 0.obs;
  final List<String> categories = ['To do', 'In Progress', 'Done'];
  RxInt selectedCategoryIndex = 0.obs;
  RxBool isVisible = RxBool(false);

  void updateSelectedCategory(int index) {
    selectedCategoryIndex.value = index;
  }

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
   // setCategoriesAndItems(allItems);

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


  var allItems = <Task>[].obs;

  void setCategoriesAndItems(List<Task> allItems) {
    this.allItems.value = allItems;
    setSelectedIndex(0);
  }

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
        tasks.value = allItems.where((item) => item.status == categories[index]).toList();
  }
}
