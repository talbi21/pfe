
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/Screens/Otp_screen.dart';

class PhoneController extends GetxController {
  final GlobalKey<FormState> PhoneFormKey =
  GlobalKey<FormState>(debugLabel: '__PhoneFormKey__');
  final numController = TextEditingController();

  PhoneController() : super();

  @override
  void onClose() {
    numController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    print('validatoooor');

    if (value == null || value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  Future<void> GetOTP() async {
    print('${numController.text}}');
    if (PhoneFormKey.currentState!.validate()) {
      try {
        await
        Get.snackbar('Done', "e.message!",
            backgroundColor: Colors.red, colorText: Colors.white);
        Get.to(OtpPage());

      } catch (err, _) {
        // message = 'There is an issue with the app during request the data, '
        //         'please contact admin for fixing the issues ' +

        numController.clear();
        rethrow;
      }
    } else {
      throw Exception('An error occurred, invalid inputs value');
    }
  }


}