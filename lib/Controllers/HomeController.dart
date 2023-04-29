import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../View/Screens/Login/Login_screen.dart';
import '../View/Screens/Task/Tasks_screen.dart';
import '../View/Screens/Home/components/ArchiveitemHome.dart';
import '../View/shared_components/loading_overlay.dart';
import '../data/api_constants.dart';
import '../model/TaskModel.dart';
import 'BottomNavigationController.dart';

class HomeController extends GetxController {
  HomeController() : super();
  final _storage = GetStorage();
  RxString nbrIssues = "".obs;
  RxString nbrFeature = "".obs;
  RxString nbrTodo = "".obs;
  RxString nbrInProgress = "".obs;
  RxString nbrDone = "".obs;
  final NavController = BottomNavigationController();
  RxString name ="".obs;
  RxString id ="".obs;
  RxString image="".obs;
  var tasks = RxList<Task>().obs;

  void fetchItems() async {

    try {
      final String url = ApiConstants.baseUrl+ApiConstants.findTasks+id.value; // Replace with your backend URL
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successful login

        final data = json.decode(response.body);
        final taskList = (data['tasks'] as List<dynamic>).map((e) => Task.fromJson(e as Map<String, dynamic>)).toList();
        tasks.value.clear();
        tasks.value.addAll(taskList);
        TypeCount();



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
      print(err);

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


    }
  }

  @override
  void onInit() {
    id.value  = _storage.read('id');
    name.value  = _storage.read('userName');
    image.value  = _storage.read('image');
    //fetchItems();
    super.onInit();
  }

  void ToIssues() async {
    NavController.changePage(3);
    print("to Issues");
  }

  void ToFeatures() {
    NavController.changePage(3);
    print("to Featsures");
  }

  RxString ToDoCount() {
    Future.delayed(Duration(seconds: 1));
    nbrTodo = RxString(Random().nextInt(100).toString());

    int count = tasks.value.where((task) => task.status == "To do").length;
    print("Number of tasks: $count");
    return nbrTodo;
  }

  RxString InProgCount() {
    Future.delayed(Duration(seconds: 1));
    nbrInProgress = RxString(Random().nextInt(100).toString());
    return nbrInProgress;
  }

  RxString DoneCount() {
    Future.delayed(Duration(seconds: 1));
    nbrDone = RxString(Random().nextInt(100).toString());
    return nbrDone;
  }

/*  RxString FeaturesCount() {
    nbrFeature = RxString(tasks.where((task) => task.type == "Feature").length.toString());
    return nbrFeature;
  }*/

 /* RxString IssuesCount() {
    Future.delayed(Duration(seconds: 1));
    nbrIssues = RxString(tasks.where((task) => task.type == "Issue").length.toString());
    return nbrIssues;
  }*/

  void LogOut() {
    _storage.erase();
    Get.offAll(LoginScreen());
  }

  void TypeCount() {

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



  

  RxList<ArchiveTask> items = <ArchiveTask>[
    ArchiveTask(title: 'Task 1', description: '12 July 2023', icon: Icons.star),
    ArchiveTask(title: 'Task 2', description: 'Description 2', icon: Icons.abc),
    ArchiveTask(
        title: 'Task 3',
        description: 'Description 3',
        icon: Icons.abc_outlined),
  ].obs;
}
