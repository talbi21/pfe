import 'package:get/get.dart';

import 'HomeController.dart';
import 'TaskController.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 1.obs;


  void changePage(int index) {
    currentIndex.value = index;
    if (index == 1){
      Get.find<HomeController>().fetchItems();
    }else if (index == 3){
      Get.find<TaskController>().fetchItems();
    }
    print("Page N°" + " " + index.toString());

  }

}
