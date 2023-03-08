
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/Screens/Home_screen.dart';
import '../View/Screens/dashboard.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey =
  GlobalKey<FormState>(debugLabel: '__loginFormKey__');
  final idController = TextEditingController();
  final passController = TextEditingController();

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

  Future<void> login() async {
    print('${idController.text}, ${passController.text}');
    if (loginFormKey.currentState!.validate()) {
      try {
        await

        Get.offAll(() => HomeScreen());
        //  Get.offAll(HomePage());
      } catch (err, _) {
        // message = 'There is an issue with the app during request the data, '
        //         'please contact admin for fixing the issues ' +

        passController.clear();
        rethrow;
      }
    } else {
      throw Exception('An error occurred, invalid inputs value');
    }
  }

  void logout() async {

  }
}