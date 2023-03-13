import 'dart:async';

import 'package:get/get.dart';

import '../View/Screens/Login/Login_screen.dart';
import 'LoginController.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    print("doneSplash");
    Timer(Duration(seconds: 5), () {
      Get.offAll(() => LoginScreen());
    });
    super.onInit();
  }
}
