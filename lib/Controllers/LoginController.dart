import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../View/Screens/Home/Home_screen.dart';
import '../View/Screens/dashboard.dart';
import '../View/shared_components/loading_overlay.dart';
import '../data/api_constants.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: '__loginFormKey__');
  final idController = TextEditingController();
  final passController = TextEditingController();
  var isObscured = true.obs;
  RxBool isLoading = false.obs;
  RxString identifiant = ''.obs;
  RxString password = ''.obs;
  RxString error = ''.obs;

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

  /*Future<void> login() async {
    try {
      isLoading.value = true; // Show loading indicator
      error.value = ''; // Reset error message

      // Make API request to backend for authentication
      final response = await http.post(Uri.parse(ApiConstants.baseUrl+ApiConstants.loginEndpoint), body: {
        'email': idController.text,
        'password': passController.text,
      });

      if (response.statusCode == 200) {
        // Successful login
        final responseData = json.decode(response.body);
        final token = responseData['token'];

        // Store authentication token locally
        // (e.g., using shared preferences, GetStorage, Hive, etc.)
        // ...

        // Navigate to home screen
        Get.offAllNamed('/home');
      } else {
        // Invalid credentials
        final responseData = json.decode(response.body);
        error.value = responseData['message'];
      }
    } catch (e) {
      // Error occurred
      error.value = 'Failed to login. Please try again later.';
    } finally {
      isLoading.value = false; // Hide loading indicator
    }
  }*/

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
