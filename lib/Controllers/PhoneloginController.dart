import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/data/api_constants.dart';
import '../View/Screens/Login/Otp_screen.dart';
import 'otpcontroller.dart';

class PhoneController extends GetxController {
  final controller = Get.put(OtpController());

  final GlobalKey<FormState> phoneFormKey =
      GlobalKey<FormState>(debugLabel: '__PhoneFormKey__');
  final numController = TextEditingController();
  final isLoading = false.obs;

  PhoneController() : super();

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  Future<void> getOTP() async {
    if (phoneFormKey.currentState!.validate()) {
      isLoading.value = true;
      update();
      try {
        const String url = ApiConstants.baseUrl +
            ApiConstants.sendOtpEndpoint; // Replace with your backend URL
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

          controller.phoneNumber = numController.text;
          Get.to(() => const OtpPage());
        } else {
          // Invalid credentials

          final responseData = json.decode(response.body);
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
      } finally {
        numController.clear();
        isLoading.value = false;
        update(); // Hide loading indicator
      }
    }
  }
}
