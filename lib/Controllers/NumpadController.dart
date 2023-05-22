import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


import '../View/Screens/dashboard.dart';
import '../data/api_constants.dart';
import '../model/UserModel.dart';

class NumpadController extends GetxController {

  final numController = TextEditingController();
  final GlobalKey<FormState> loginPhoneFormKey =
  GlobalKey<FormState>(debugLabel: '__loginPhoneFormKey__');
  var phoneNumber = '';
  RxString error = ''.obs;
  final _storage = GetStorage();

  NumpadController() : super();
  @override
  void onClose() {
    numController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();

  }
  void delete() async {
    if (!numController.text.isEmpty) {
      numController.text =
          numController.text.substring(0, numController.text.length - 1);
    }
  }

  void taper(String? value) async {
    numController.text = value!;
  }

  String? validator(String? value) {
    print('validatoooor');

    if (value != null && value.isEmpty ) {
      return 'Please this field must be filled';
    }
    if ( value!.length < 4 || value!.length >4 ) {
      return 'Enter a 4 digits password';
    }
    return null;
  }



  Future<void> login() async {
    if (loginPhoneFormKey.currentState!.validate()) {

      try {


        // Make API request to backend for authentication
        print(numController.text);

        final String url = ApiConstants.baseUrl+ApiConstants.loginPhoneEndpoint; // Replace with your backend URL
        final http.Response response = await http.post(
          Uri.parse(url),
          body: jsonEncode({'phoneNumber': phoneNumber, 'phonePassword': numController.text}),
          headers: {'Content-Type': 'application/json'},
        );

        print(numController.text);
        if (response.statusCode == 200) {
          // Successful login
          final responseData = json.decode(response.body);

          final user = User.fromJson(responseData['user']);
          final token = responseData['token'];
          _storage.write('id', user.id);
          _storage.write('userName', user.userName);
          _storage.write('identifiant', user.email);
          _storage.write('password', user.password);
          _storage.write('phoneNumber', user.phoneNumber);
          _storage.write('image', user.image);
          _storage.write('token', token);

          Get.offAll(() => HomeScreen());

          print(responseData);

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
        print(e);
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
        numController.clear(); // Hide loading indicator
      }
    }
  }
}
