import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/BottomNavigationController.dart';
import '../shared_components/NavigationBar.dart';
import 'Archive/Archive_screen.dart';
import 'Home/Home_screen.dart';
import 'Profile/Profile_screen.dart';
import 'Task/Tasks_screen.dart';

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
                    ),
              )),
        ],
      ),
      //   bottomNavigationBar:
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return Archive_screen();
      case 1:
        return HomePage();
      case 2:
        return ProfilePage();
      case 3:
        return TaskPage();
      default:
        return Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}
