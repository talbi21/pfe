import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../View/Screens/dashboard.dart';
import '../data/api_constants.dart';
import '../model/UserModel.dart';

class UpdatePasswordController extends GetxController {
  final _storage = GetStorage();
  final GlobalKey<FormState> PasswordFormKey =
  GlobalKey<FormState>(debugLabel: '__PasswordFormKey__');
  final RxString  id ="".obs ;
  final oldPassController = TextEditingController();
  final newPasController = TextEditingController();
  final confirmPassController = TextEditingController();
  var isOldObscured = true.obs;
  var isNewObscured = true.obs;
  var isConfirmObscured = true.obs;

  String? validator(String? value) {

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }
  String? confirmvalidator(String? value) {

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    if (value != newPasController.text) {
      return 'Confirm password does not match';
    }
    return null;
  }

  @override
  void onInit() {
    id.value  = _storage.read('id');
    super.onInit();
    print(id);
  }
  @override
  void onClose() {
    oldPassController.dispose();
    newPasController.dispose();
    confirmPassController.dispose();
    super.onClose();
  }

  Future<void> UpdatePassword() async {
    if (PasswordFormKey.currentState!.validate()) {

      try {

        // Make API request to backend for authentication
print("hrere"+id.value);

        final String url = ApiConstants.baseUrl+ApiConstants.updatePasswordEndpoint+id.toString(); // Replace with your backend URL
        final http.Response response = await http.post(
          Uri.parse(url),
          body: jsonEncode({'oldPassword': oldPassController.text, 'newPassword': newPasController.text}),
          headers: {'Content-Type': 'application/json'},
        );


        if (response.statusCode == 200) {
          // Successful login
          final responseData = json.decode(response.body);

          final user = User.fromJson(responseData['user']);
          _storage.write('password', user.password);


          print(responseData);

          final token = responseData['token'];
          print(token);

          Get.offAll(() => HomeScreen());



          // Store authentication token locally
          // (e.g., using shared preferences, GetStorage, Hive, etc.)
          // ...
          // Navigate to home screen
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
      } catch (e) {
        // Error occurred
        print(e);

        Get.snackbar(
          "Error",
          "Failed to update,try again",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.withOpacity(.75),
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
          shouldIconPulse: true,
          barBlur: 20,
        );
      } finally {
        oldPassController.clear();
        newPasController.clear();
        confirmPassController.clear();// Hide loading indicator
      }
    }
  }
}