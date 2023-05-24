import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../model/TaskModel.dart';
import 'HomeController.dart';

class ProfileController extends GetxController {
  RxBool isToggleOn = true.obs;
  RxString nbrIssuesDone = "".obs;
  RxString nbrFeaturesDone = "".obs;
  RxString nbrTodo = "".obs;
  var tasks = RxList<Task>();
  final isLoading = false.obs;

  RxString TaskInprogress = "".obs;
  final _storage = GetStorage();
  RxString id = "".obs;
  RxString userName = "".obs;
  RxString email = "".obs;
  RxString phoneNumber = "".obs;
  RxString image = "".obs;
  RxString dateJoined = "".obs;



  @override
  void onInit() {
    fetchItems();
    id.value  = _storage.read('id');
    userName.value = _storage.read('userName');
    image.value  = _storage.read('image');
    email.value =_storage.read('identifiant');
    phoneNumber.value =_storage.read('phoneNumber');
    DateTime dateTime = DateTime.parse(_storage.read('dateJoined'));
    String month = DateFormat('MMMM').format(dateTime);
    String year = DateFormat('y').format(dateTime);
    dateJoined.value = month+" "+year;
    print(dateJoined.value);
    super.onInit();

  }

  void fetchItems() async {
    isLoading.value = true;
    update();
    try {
      final List<Task> fetchedItems = Get.find<HomeController>().tasks.value;
      tasks.clear();
      // final List<Task> fetchedItems =  ListTasks;

      tasks.addAll(fetchedItems);
      WorkCount();
      isLoading.value = false;
      update();
    } catch (e) {
      print(e);
    }
  }

  void toWork() {
    isToggleOn.value = false;
  }

  void toAbout() {
    isToggleOn.value = true;
  }


  void WorkCount() {

    String countIssues  = tasks.value.where((task) => task.type == "Issue" && task.status == "Done").length.toString();
    String countFeature  = tasks.value.where((task) => task.type == "Feature"&& task.status == "Done").length.toString();
    String countToDo  = tasks.value.where((task) => task.status == "To do").length.toString();
    String countInProgress  = tasks.value.where((task) => task.status == "In Progress").length.toString();

    nbrIssuesDone.value = countIssues;
    nbrFeaturesDone.value = countFeature;
    nbrTodo.value = countToDo;
    TaskInprogress.value = countInProgress;
  }

}
