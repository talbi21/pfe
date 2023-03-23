import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/Screens/Home/Home_screen.dart';
import '../View/Screens/dashboard.dart';
import '../View/shared_components/loading_overlay.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: '__loginFormKey__');
  final idController = TextEditingController();
  final passController = TextEditingController();
  var isObscured = true.obs;

  LoginController() : super();

  @override
  void onClose() {
    idController.dispose();
    passController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    print('validatoooor');

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void login() async {
    print('${idController.text}, ${passController.text}');
    if (loginFormKey.currentState!.validate()) {
      LoadingOverlay.show(message: 'Login...');
      try {
        await Timer(Duration(seconds: 5), () {
          Get.offAll(() => HomeScreen());
        });

        //   Get.offAllNamed(Routes.HOME);
        print("done");
      } catch (err, _) {
        LoadingOverlay.hide();
        passController.clear();
        Get.snackbar(
          "Error",
          err.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.withOpacity(.75),
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
          shouldIconPulse: true,
          barBlur: 20,
        );
      } finally {}

      loginFormKey.currentState!.save();
    }
  }
}
