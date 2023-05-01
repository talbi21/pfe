import 'package:get/get.dart';

import '../data/tasks.dart';
import '../model/TaskModel.dart';
import 'HomeController.dart';

class TaskController extends GetxController {
  var tasks = RxList<Task>();
  final List<String> Status = ['To do', 'In Progress', 'Done', ''];
  final List<String> Types = ['Feature', 'Issue', ''];
  RxInt selectedStatusIndex = 3.obs;
  RxInt selectedTypeIndex = 2.obs;
  RxList<RxBool> isVisibleList = <RxBool>[].obs;
  RxList<RxBool> isHistoryVisibleList = <RxBool>[].obs;

  void initVisibilityList(int itemCount) {
    isVisibleList.assignAll(List.generate(itemCount, (index) => false.obs));
    isHistoryVisibleList
        .assignAll(List.generate(itemCount, (index) => false.obs));
  }

  List<Task> TaskSelected() {
    if ((selectedTypeIndex.value == 0 || selectedTypeIndex.value == 1) &&
        selectedStatusIndex.value == 3) {
      return tasks
          .where(
              (task) => task.type == Types[selectedTypeIndex.value].toString())
          .toList();
    }else
    if (selectedStatusIndex.value == 3 && selectedTypeIndex.value == 2) {
      return tasks;
    } else if(selectedTypeIndex == 2){
      return tasks
          .where(
              (task) => task.status == Status[selectedStatusIndex.value].toString())
          .toList();

    }

    final taskselected = tasks
        .where((task) =>
            task.status == Status[selectedStatusIndex.value].toString() &&
            task.type == Types[selectedTypeIndex.value].toString())
        .toList();
    return taskselected;
  }

  void updateSelectedStatus(int index) {
    if (selectedStatusIndex.value == index) {
      selectedStatusIndex.value = 3;
    } else {
      selectedStatusIndex.value = index;
    }
  }

  void updateSelectedType(int index) {
    if (selectedTypeIndex.value == index) {
      selectedTypeIndex.value = 2;
    } else{
      selectedTypeIndex.value = index;
    }

  }

  void toType(int index){
    if(index==1){
      selectedTypeIndex.value =0;
    }else if(index ==2){
      selectedTypeIndex.value =1;
    }
    selectedStatusIndex.value =3;
  }

  void toStatus(int index){
    if(index==1){
      selectedStatusIndex.value =0;
    }else if(index ==2){
      selectedStatusIndex.value =1;
    }else if (index == 3){
      selectedStatusIndex.value = 2;
    }
    selectedTypeIndex.value =2;
  }

  void toggleVisibility(int index) {
    isVisibleList[index].toggle();
    print("toggle done");
  }

  void toggleHistoryVisibility(int index) {
    isHistoryVisibleList[index].toggle();
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
      final List<Task> fetchedItems = Get.find<HomeController>().tasks.value;
      tasks.value.clear();
      // final List<Task> fetchedItems =  ListTasks;
      tasks.addAll(fetchedItems);
    } catch (e) {
      print(e);
    }
  }
}
