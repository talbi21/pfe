import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../View/Screens/Login/NumPad_screen.dart';
import '../data/api_constants.dart';
import 'NumPadController.dart';

class OtpController extends GetxController {
  final controller = Get.put(NumPadController());
  final GlobalKey<FormState> otpFormKey =
      GlobalKey<FormState>(debugLabel: '__OtpFormKey__');
  var otp = ''.obs;
  var phoneNumber = '';
  final isLoading = false.obs;

  String? validator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    if (value!.length < 4) {
      return 'Enter a 4 digits otp';
    }
    return null;
  }

  void setOtp(String value) {
    otp.value = value;
  }

  Future<void> verifyOtp() async {
    if (otpFormKey.currentState!.validate()) {
      isLoading.value = true;
      update();

      try {
        const String url = ApiConstants.baseUrl +
            ApiConstants.verifOtpEndpoint; // Replace with your backend URL
        final http.Response response = await http.post(
          Uri.parse(url),
          body: jsonEncode({'phoneNumber': phoneNumber, 'otp': otp.value}),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          // Successful login
          final responseData = json.decode(response.body);
          controller.phoneNumber = phoneNumber;
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


          Get.to(() => NumPadscreen());
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
        otp.value = "";
        isLoading.value = false;
        update(); // Hide loading indicator
      }
    }
  }
}
