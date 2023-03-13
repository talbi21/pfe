import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/Screens/Task/Tasks_screen.dart';
import '../View/Screens/Home/components/ArchiveitemHome.dart';
import 'BottomNavigationController.dart';

class HomeController extends GetxController {
  HomeController() : super();
  RxString nbrIssues = "".obs;
  RxString nbrFeature = "".obs;
  RxString nbrTodo = "".obs;
  RxString nbrInProgress = "".obs;
  RxString nbrDone = "".obs;
  final NavController = BottomNavigationController();

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

  RxString FeaturesCount() {
    Future.delayed(Duration(seconds: 1));
    nbrFeature = RxString(Random().nextInt(100).toString());
    return nbrFeature;
  }

  RxString IssuesCount() {
    Future.delayed(Duration(seconds: 1));
    nbrIssues = RxString(Random().nextInt(100).toString());
    return nbrIssues;
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
