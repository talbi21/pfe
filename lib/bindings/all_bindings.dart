import 'package:get/get.dart';
import 'package:untitled2/Controllers/PopupController.dart';

import '../Controllers/BottomNavigationController.dart';
import '../Controllers/HomeController.dart';
import '../Controllers/LoginController.dart';
import '../Controllers/NumpadController.dart';
import '../Controllers/OtpController.dart';
import '../Controllers/PhoneloginController.dart';
import '../Controllers/ProfileController.dart';
import '../Controllers/SplashController.dart';
import '../Controllers/TaskController.dart';
import '../Controllers/UpdatePasswordController.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => PhoneController());
    Get.lazyPut(() => OtpController());
    Get.lazyPut(() => NumpadController());
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => BottomNavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => TaskController());
    Get.lazyPut(() => PopupController());
    Get.lazyPut(() => UpdatePasswordController());


  }
}
