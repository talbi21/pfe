import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../data/api_constants.dart';
import '../model/UserModel.dart';

class UpdateController extends GetxController {
  final _storage = GetStorage();

  final GlobalKey<FormState> updateFormKey =
  GlobalKey<FormState>(debugLabel: '__updateFormKey__');
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  final phoneController = TextEditingController();
  final passPhoneController = TextEditingController();
  final confirmPhonePassController = TextEditingController();
  var username = '';
  var email = '';
  var phoneNumber = '';
  var id ='';
  final isLoading = false.obs;
  final hasError = false.obs;
  RxString error = ''.obs;




  @override
  void onInit() {
    super.onInit();

    refreshdata();




  }

  String? confirmvalidator(String? value) {

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    if (value != newPassController.text) {
      return 'Confirm password does not match';
    }
    return null;
  }

  String? confirmphonevalidator(String? value) {

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    if (value != passPhoneController.text) {
      return 'Confirm password does not match';
    }
    return null;
  }

  String? validator(String? value) {

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  String? validatorPass(String? value) {

    if (value != null && value.isEmpty ) {
      return 'Please this field must be filled';
    }
    if ( value!.length < 4 ) {
      return 'Enter a 4 digits otp';
    }
    return null;
  }

  Future<void> updateUser() async {

    if (updateFormKey.currentState!.validate()) {
      isLoading.value = true;
      update();
      try {
      final String url = ApiConstants.baseUrl +
          ApiConstants.updateUser+id; // Replace with your backend URL
      final http.Response response = await http.put(
        Uri.parse(url),
        body: jsonEncode({'userName': userNameController.text,
          'identifiant': emailController.text,
          'oldPassword': oldPassController.text,
          'newPassword': newPassController.text,
          'phoneNumber': phoneController.text,
          'phonePassword': passPhoneController.text,}),
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


        Get.snackbar('Success', 'User updated');



        print(responseData);







      }



       else if (response.statusCode == 401) {
        error.value = 'Invalid password';
      // Invalid password
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
    } else if (response.statusCode == 404) {
      // User not found
      error.value = 'User not found';
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

      } else {
      // Other errors
        error.value ='An error occurred while updating the user';
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
    error.value = 'Failed to update. Please try again later.';
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
    oldPassController.clear();
    newPassController.clear();
    confirmPassController.clear();
    passPhoneController.clear();
    confirmPhonePassController.clear();
    isLoading.value = false;
    update();

    }
    }
  }

  void refreshdata() async {
    id  = _storage.read('id');
    username  = _storage.read('userName');
    email  = _storage.read('identifiant');
    phoneNumber  = _storage.read('phoneNumber');
    userNameController.text = username;
    emailController.text = email;
    phoneController.text = phoneNumber;

  }


  @override
  void onClose() {
    // Clean up text controllers
    userNameController.dispose();
    emailController.dispose();
    oldPassController.dispose();
    newPassController.dispose();
    confirmPassController.dispose();
    phoneController.dispose();
    passPhoneController.dispose();
    confirmPhonePassController.dispose();
    super.onClose();
  }
}