import 'package:get/get.dart';


import '../data/tasks.dart';
import '../model/TaskModel.dart';

class TaskController extends GetxController {

  var tasks = RxList<Task>();
  var selectedIndex = 0.obs;
  final List<String> Status = ['To do', 'In Progress', 'Done'];
  final List<String> Types = ['Feature', 'Issue'];
  RxInt selectedStatusIndex = 0.obs;
  RxInt selectedTypeIndex = 0.obs;
  RxList<RxBool> isVisibleList = <RxBool>[].obs;

  void initVisibilityList(int itemCount) {
    isVisibleList.assignAll(List.generate(itemCount, (index) => false.obs));
  }



  void updateSelectedStatus(int index) {
    selectedStatusIndex.value = index;
  }

  void updateSelectedType(int index) {
    selectedTypeIndex.value = index;
  }

  void toggleVisibility(int index) {
    isVisibleList[index].toggle();
    print("toggle done");
  }







  @override
  void onInit() {
    fetchItems();
    super.onInit();
    initVisibilityList(tasks.length);

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
