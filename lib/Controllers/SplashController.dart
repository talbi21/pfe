import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../View/Screens/Login/Login_screen.dart';
import '../View/Screens/dashboard.dart';

class SplashController extends GetxController {

  final _storage = GetStorage();

  void VerifLogin(){
    if (_storage.hasData('token')){
      Get.offAll(() => HomeScreen());
    }else{
      Get.offAll(() => LoginScreen());
    }
  }
  @override
  void onInit() {
    print("doneSplash");

    Timer(Duration(seconds: 5), () {
      VerifLogin();
    });
    super.onInit();
  }
}
