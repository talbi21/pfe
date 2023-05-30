import 'package:get/get.dart';
import 'package:untitled2/Controllers/ProfileController.dart';
import 'archiveController.dart';
import 'HomeController.dart';
import 'TaskController.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 1.obs;

  void changePage(int index) {
    Get.lazyPut(() => ArchiveController());
    Get.lazyPut(() => ProfileController());
    currentIndex.value = index;
    if (index == 1) {
      Get.find<HomeController>().fetchItems();
      Get.find<HomeController>().storageRefresh();
    } else if (index == 3) {
      Get.find<TaskController>().fetchItems();
    } else if (index == 0) {
      Get.find<ArchiveController>().fetchItems();
    } else if (index == 2) {
      Get.find<ProfileController>().fetchItems();
    }
  }
}
