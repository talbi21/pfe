import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../View/Screens/Login/NumPad_screen.dart';
import '../data/api_constants.dart';

class OtpController extends GetxController {
  final GlobalKey<FormState> OtpFormKey =
  GlobalKey<FormState>(debugLabel: '__OtpFormKey__');
  var otp = ''.obs;
  var phoneNumber = '';

  String? validator(String? value) {
    print('validatoooor');

    if (value != null && value.isEmpty ) {
      return 'Please this field must be filled';
    }
    if ( value!.length < 4 ) {
      return 'Enter a 4 digits otp';
    }
    return null;
  }

  void setOtp(String value) {
    otp.value = value;
  }

  Future<void> verifyOtp() async {
    if (OtpFormKey.currentState!.validate()) {
      // Get.to(() => NumPadscreen());
      try {
        final String url = ApiConstants.baseUrl+ApiConstants.verifOtpEndpoint; // Replace with your backend URL
        final http.Response response = await http.post(
          Uri.parse(url),
          body: jsonEncode({'phoneNumber': phoneNumber,'otp': otp.value}),
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

          Get.to(() => NumPadscreen());
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

      }catch (err, _) {
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
print(err.toString());

      }finally {
        otp.value ="";
      }
    }
  }
}
