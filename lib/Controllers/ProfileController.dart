import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isToggleOn = true.obs;
  RxString nbrIssuesDone = "".obs;
  RxString nbrFeaturesDone = "".obs;
  RxString HoursWorked = "".obs;
//  RxInt TaskInprogress = 0.obs;
  RxString TaskInprogress = "".obs;

  void toWork() {
    isToggleOn.value = false;
  }

  void toAbout() {
    isToggleOn.value = true;
  }

  RxString IssuesDone() {
    Future.delayed(Duration(seconds: 1));
    nbrIssuesDone = RxString(Random().nextInt(100).toString());
    return nbrIssuesDone;
  }

  RxString FeaturesDone() {
    Future.delayed(Duration(seconds: 1));
    nbrFeaturesDone = RxString(Random().nextInt(100).toString());
    return nbrFeaturesDone;
  }

  RxString HoursWorkedCount() {
    Future.delayed(Duration(seconds: 1));
    HoursWorked = RxString(Random().nextInt(100).toString());
    return HoursWorked;
  }

  /*RxInt TaskInprogressCount()  {
    Future.delayed(Duration(seconds: 1));
    TaskInprogress =Random().nextInt(100) as RxInt;
    return TaskInprogress;

  }*/
  RxString InprogressCount() {
    Future.delayed(Duration(seconds: 1));
    TaskInprogress = RxString(Random().nextInt(100).toString());
    return TaskInprogress;
  }
}
