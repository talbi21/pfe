import 'package:get/get.dart';

import 'ArchiveController.dart';
import 'HomeController.dart';
import 'TaskController.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 1.obs;


  void changePage(int index) {
    Get.lazyPut(()=>ArchiveController());
    currentIndex.value = index;
    if (index == 1){
      Get.find<HomeController>().fetchItems();
    }else if (index == 3){
      Get.find<TaskController>().fetchItems();
    }else if (index == 0){
      Get.find<ArchiveController>().fetchItems();
    }
    print("Page N°" + " " + index.toString());

  }

}
