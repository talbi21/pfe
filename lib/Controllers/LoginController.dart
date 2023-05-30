import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../View/Screens/Login/UpdatePassword.dart';
import '../View/Screens/dashboard.dart';
import '../data/api_constants.dart';
import '../model/UserModel.dart';

class LoginController extends GetxController {
  final _storage = GetStorage();
  final GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: '__loginFormKey__');
  final idController = TextEditingController();
  final passController = TextEditingController();
  var isObscured = true.obs;
  RxString error = ''.obs;
  final isLoading = false.obs;

  LoginController() : super();

  @override
  void onClose() {
    idController.dispose();
    passController.dispose();
    super.onClose();
  }


  String? validator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      isLoading.value = true;
      update();
      try {
        // Make API request to backend for authentication

        const String url = ApiConstants.baseUrl +
            ApiConstants.loginEndpoint; // Replace with your backend URL
        final http.Response response = await http.post(
          Uri.parse(url),
          body: jsonEncode({
            'identifiant': idController.text,
            'password': passController.text
          }),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          // Successful login
          final responseData = json.decode(response.body);

          final user = User.fromJson(responseData['user']);
          _storage.write('id', user.id);
          _storage.write('userName', user.userName);
          _storage.write('identifiant', user.email);
          _storage.write('password', user.password);
          _storage.write('phoneNumber', user.phoneNumber);
          _storage.write('image', user.image);
          _storage.write('dateJoined', user.dateJoined);


          if (user.firstConnect) {
            Get.offAll(() => UpdatePassword());
          } else {
            final token = responseData['token'];
            _storage.write('token', token);
            Get.offAll(() => HomeScreen());
          }
        } else {
          // Invalid credentials

          final responseData = json.decode(response.body);
          error.value = responseData['message'];
          Get.snackbar(
            "Error",
            error.value.toString(),
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
        error.value = 'Failed to login. Please try again later.';
        Get.snackbar(
          "Error",
          error.value.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.withOpacity(.75),
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
          shouldIconPulse: true,
          barBlur: 20,
        );
      } finally {
        passController.clear();
        isLoading.value = false;
        update(); // Hide loading indicator
      }
    }
  }
}
