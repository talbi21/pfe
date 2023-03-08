import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/View/widgets/Taskitem.dart';

import '../../Controllers/BottomNavigationController.dart';
import '../widgets/NavigationBar.dart';
import '../widgets/appBa.dart';

class TaskPage extends StatelessWidget {
  final controller = Get.put(BottomNavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appba(),
          Taskitem(show: true),
        ],

      ),
    );
  }
}
