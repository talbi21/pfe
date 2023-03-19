import 'dart:ui';

import 'package:get/get.dart';

class Task {
  final String title;
  final String date;
  final String description ;
  final String status ;
  final String type ;
  RxBool isToggleOn = false.obs;
   Task({
    required this.title,
    required this.date,
    required this.description,
    required this.status,
    required this.type,
  });
}
