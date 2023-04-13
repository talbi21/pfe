import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/data/api_constants.dart';

import '../View/Screens/Login/Otp_screen.dart';
import 'OtpController.dart';

class PhoneController extends GetxController {
  final controller = Get.put(OtpController());
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
    print('${numController.text}');
    if (PhoneFormKey.currentState!.validate()) {
      try {
        final String url = ApiConstants.baseUrl+ApiConstants.sendOtpEndpoint; // Replace with your backend URL
        final http.Response response = await http.post(
            Uri.parse(url),
            body: jsonEncode({'phoneNumber': numController.text}),
            headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          // Successful login
          final responseData = json.decode(response.body);

          Get.snackbar(
            "Done",
            responseData['message'].toString(),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green.withOpacity(.75),
            colorText: Colors.white,
            icon: const Icon(Icons.error, color: Colors.white),
            shouldIconPulse: true,
            barBlur: 20,
          );
         // print(token);
          print(responseData);

          // Store authentication token locally
          // (e.g., using shared preferences, GetStorage, Hive, etc.)
          // ...
          controller.phoneNumber = numController.text;
          Get.to(() => OtpPage());
          // Navigate to home screen
        } else {
          // Invalid credentials

          final responseData = json.decode(response.body);
         // error.value = responseData['message'];
          Get.snackbar(
            "Error",
            responseData['message'].toString(),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red.withOpacity(.75),
            colorText: Colors.white,
            icon: const Icon(Icons.error, color: Colors.white),
            shouldIconPulse: true,
            barBlur: 20,
          );
        }

      } catch (err, _) {
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


      }finally {
        numController.clear();
      }
    }
  }





}
