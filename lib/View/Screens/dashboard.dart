import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/BottomNavigationController.dart';

import '../widgets/NavigationBar.dart';
import 'Home_screen.dart';
import 'Profile_screen.dart';
import 'Tasks_screen.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => _buildPage(controller.currentIndex.value)),
          Obx(() => Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: CustomBottomNavigationBar(
                    selectedIndex: controller.currentIndex.value,
                    controller: controller,
                    isActive: controller.isActive),
              )),
        ],
      ),
      //   bottomNavigationBar:
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return TaskPage();
      case 1:
        return HomePage();
      case 2:
        return ProfilePage();
      case 3:
        controller.toggle();
        return TaskPage();
      default:
        return Center(
          child: Text('Error'),
        );
    }
  }
}
