import 'package:get/get.dart';

import '../Controllers/BottomNavigationController.dart';
import '../Controllers/HomeController.dart';
import '../Controllers/LoginController.dart';
import '../Controllers/NumpadController.dart';
import '../Controllers/OtpController.dart';
import '../Controllers/PhoneloginController.dart';
import '../Controllers/ProfileController.dart';
import '../Controllers/SplashController.dart';

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
  }
}
