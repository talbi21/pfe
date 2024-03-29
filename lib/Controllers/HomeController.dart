import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/Controllers/TaskController.dart';
import '../View/Screens/Login/Login_screen.dart';
import '../data/api_constants.dart';
import '../model/TaskModel.dart';
import 'archiveController.dart';
import 'bottomNavigationController.dart';

class HomeController extends GetxController {
  HomeController() : super();
  final _storage = GetStorage();
  RxString nbrIssues = "".obs;
  RxString nbrFeature = "".obs;
  RxString nbrTodo = "".obs;
  RxString nbrInProgress = "".obs;
  RxString nbrDone = "".obs;
  RxString name ="".obs;
  RxString id ="".obs;
  RxString image="".obs;
  var tasks = RxList<Task>().obs;
  var archiveTasks = RxList<Task>().obs;
  final isLoading = false.obs;
  final hasError = false.obs;
  ArchiveController archiveController = Get.put(ArchiveController());

  void fetchItems() async {
    isLoading.value = true;
    hasError.value = false;
    update();

    try {
      final String url = ApiConstants.baseUrl + ApiConstants.findTasksEndpoint + id.value;
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final taskList = (data['tasks'] as List<dynamic>).map((e) => Task.fromJson(e as Map<String, dynamic>)).toList();
        tasks.value.clear();
        archiveTasks.value.clear();
        for (var task in taskList) {
          if (!task.isArchived) {
            tasks.value.add(task);
          } else {
            archiveTasks.value.add(task);
          }
        }
        typeCount();
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
        hasError.value = true;
        update();// Set the hasError flag to true
      } else {
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
        hasError.value = true;
        update();// Set the hasError flag to true
      }
    } catch (err, _) {
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
      hasError.value = true;
      update();// Set the hasError flag to true
    } finally {
      isLoading.value = false;
      update();
    }
  }

  @override
  void onInit() {
    storageRefresh();
    fetchItems();
    super.onInit();
  }

  void toIssues() async {
    Get.find<BottomNavigationController>().changePage(3);
    Get.find<TaskController>().toType(2);}

  void toFeatures() {
    Get.find<BottomNavigationController>().changePage(3);
    Get.find<TaskController>().toType(1);
  }
  void toTodo() async {
    Get.find<BottomNavigationController>().changePage(3);
    Get.find<TaskController>().toStatus(1);
  }
  void toInProgress() async {
    Get.find<BottomNavigationController>().changePage(3);
    Get.find<TaskController>().toStatus(2);
  }
  void toDone() async {
    Get.find<BottomNavigationController>().changePage(3);
    Get.find<TaskController>().toStatus(3);
  }
  void storageRefresh() {
    id.value  = _storage.read('id');
    name.value  = _storage.read('userName');
    image.value  = _storage.read('image');
  }


  void logOut() {
    _storage.erase();
    Get.offAll(const LoginScreen());
  }

  void removeTaskById(String id) {
    archiveTasks.value.removeWhere((task) => task.id == id);
  }

  void deleteArchiveItem(String id) async {
    isLoading.value = true;
    update();

    bool deleteResult = await archiveController.deleteItem(id);
    if (deleteResult) {
      removeTaskById(id);
    }
    isLoading.value = false;
    update();
  }

  void typeCount() {

   String countIssues  = tasks.value.where((task) => task.type == "Issue").length.toString();
   String countFeature  = tasks.value.where((task) => task.type == "Feature").length.toString();
   String countToDo  = tasks.value.where((task) => task.status == "To do").length.toString();
   String countInProgress  = tasks.value.where((task) => task.status == "In Progress").length.toString();
   String countDone   = tasks.value.where((task) => task.status == "Done").length.toString();

   nbrIssues.value = countIssues;
   nbrFeature.value = countFeature;
   nbrTodo.value = countToDo;
   nbrInProgress.value = countInProgress;
   nbrDone.value = countDone;
  }



}
