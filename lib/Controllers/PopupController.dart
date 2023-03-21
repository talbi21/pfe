import 'package:get/get.dart';

import '../View/Screens/Task/components/FixPopUp.dart';
import '../View/Screens/Task/components/ToArchivePopup.dart';
import '../model/TaskModel.dart';
import 'BottomNavigationController.dart';

class PopupController extends GetxController {
  final Navcontroller = Get.put(BottomNavigationController());

  void openPopup(Task item) {
    Get.dialog(FixPopUp(task: item));
  }


  void openArchivePopup() {
    Get.back();
    Get.dialog(ArchivePopup());
  }

  void closeArchivePopup() {
    Get.back();
    Navcontroller.changePage(0);
  }
}

