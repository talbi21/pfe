import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 1.obs;
  var isActive = true;

  void changePage(int index) {
    currentIndex.value = index;
    print("Page N°"+" "+index.toString());
  }
  void toggle() {
    isActive = !isActive;
}
}