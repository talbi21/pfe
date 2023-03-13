import 'dart:ui';

import 'package:get/get.dart';

class Task {
  final String title;
  final String date;
  final String description ;
  final Status status ;
  final Type type ;
  RxBool isToggleOn = false.obs;
   Task({
    required this.title,
    required this.date,
    required this.description,
    required this.status,
    required this.type,
  });
}

enum Status {
  ToDo('To do'),
  InProgress('In Progress'),
  Done('Done');

  const Status(this.text);
  final String text;
}

enum Type {
  Issue('Issue'),
  Feature('Feature');


  const Type(this.text);
  final String text;
}