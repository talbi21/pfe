import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/api_constants.dart';
import 'package:http/http.dart' as http;
import '../model/TaskModel.dart';
import 'HomeController.dart';
import 'PopupController.dart';

class TaskController extends GetxController {
  var tasks = RxList<Task>();
  final List<String> Status = ['To do', 'In Progress', 'Done', ''];
  final List<String> Types = ['Feature', 'Issue', ''];
  RxInt selectedStatusIndex = 3.obs;
  RxInt selectedTypeIndex = 2.obs;
  RxList<RxBool> isVisibleList = <RxBool>[].obs;
  RxList<RxBool> isHistoryVisibleList = <RxBool>[].obs;
  final isLoading = false.obs;

  void initVisibilityList(int itemCount) {
    isVisibleList.assignAll(List.generate(itemCount, (index) => false.obs));
    isHistoryVisibleList.assignAll(List.generate(itemCount, (index) => false.obs));
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
    initVisibilityList(tasks.length);
    update();
    if (selectedStatusIndex.value == index) {
      selectedStatusIndex.value = 3;
    } else {
      selectedStatusIndex.value = index;
    }
  }

  void updateSelectedType(int index) {
    initVisibilityList(tasks.length);
    update();
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

  }

  void fetchItems() async {
    isLoading.value = true;
    update();
    initVisibilityList(tasks.length);
    try {
      final List<Task> fetchedItems = Get.find<HomeController>().tasks.value;
      tasks.value.clear();
      // final List<Task> fetchedItems =  ListTasks;
      tasks.addAll(fetchedItems);
      isLoading.value = false;
      update();
    } catch (e) {
      print(e);
    }
  }

  void StartFix(String id) async {


    isLoading.value = true;
    update();
    try {

      final String url = ApiConstants.baseUrl+ApiConstants.StartFixTaskEndpoint+id; // Replace with your backend URL
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successful login
        tasks.removeWhere((task) => task.id == id);
        print (tasks.length);
        final data = json.decode(response.body);
        Task newTask = Task.fromJson(data);


        tasks.add(newTask);
        toStatus(2);
        initVisibilityList(tasks.length);


      } else if (response.statusCode == 401) {

        final responseData = json.decode(response.body);
        Get.snackbar(
          "Error",
          responseData['message'].toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.withOpacity(.75),
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
          shouldIconPulse: true,
          barBlur: 20,
        );





      } else {
        // Invalid credentials
        print("test3");
        final responseData = json.decode(response.body);
        // error.value = responseData['message'];
        print(responseData);
        Get.snackbar(
          "Error",
          responseData['message'].toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.withOpacity(.75),
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
          shouldIconPulse: true,
          barBlur: 20,
        );
      }

    } catch (err, _) {
      print("test4");
      Get.snackbar(
        "Error",
        err.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(.75),
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
        barBlur: 20,
      );


    }finally {
      isLoading.value = false;
      update();
    }
  }

  void FixTask(Task item) {
   if (item.status == "To do"){
     StartFix(item.id);
     initVisibilityList(tasks.length);


   } else if (item.status == "Done"){

     Archivetask(item.id);
     initVisibilityList(tasks.length);
   } else {
     Get.find<PopupController>().openPopup(item);
   }
  }


  void Archivetask(String id) async {


    isLoading.value = true;
    update();
    try {

      final String url = ApiConstants.baseUrl+ApiConstants.ArchiveTaskEndpoint+id; // Replace with your backend URL
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successful login
        tasks.removeWhere((task) => task.id == id);
        print (tasks.length);
        final data = json.decode(response.body);
        Task newTask = Task.fromJson(data);


       // tasks.add(newTask);
        toStatus(3);


      } else if (response.statusCode == 401) {

        final responseData = json.decode(response.body);
        Get.snackbar(
          "Error",
          responseData['message'].toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.withOpacity(.75),
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
          shouldIconPulse: true,
          barBlur: 20,
        );





      } else {
        // Invalid credentials
        print("test3");
        final responseData = json.decode(response.body);
        // error.value = responseData['message'];
        print(responseData);
        Get.snackbar(
          "Error",
          responseData['message'].toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.withOpacity(.75),
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
          shouldIconPulse: true,
          barBlur: 20,
        );
      }

    } catch (err, _) {
      print("test4");
      Get.snackbar(
        "Error",
        err.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(.75),
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
        barBlur: 20,
      );


    }finally {
      isLoading.value = false;
      update();
    }
  }
}
