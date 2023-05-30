import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/bottomNavigationController.dart';
import '../shared_components/NavigationBar.dart';
import 'Archive/Archive_screen.dart';
import 'Home/Home_screen.dart';
import 'Profile/Profile_screen.dart';
import 'Task/tasks_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

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
        return const ArchiveScreen();
      case 1:
        return const HomePage();
      case 2:
        return ProfilePage();
      case 3:
        return TaskPage();
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}
