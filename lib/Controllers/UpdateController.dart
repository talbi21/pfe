import 'dart:convert';
import 'package:file_picker/file_picker.dart';
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
  var id = '';
  var imageUrl = '';
  Rx<FilePickerResult?> selectedFile = Rx<FilePickerResult?>(null);
  final isLoading = false.obs;
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
    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    if (value!.length < 4) {
      return 'Enter a 4 digits otp';
    }
    return null;
  }

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        selectedFile.value = result;
      }
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> updateUser() async {
    if (updateFormKey.currentState!.validate()) {
      isLoading.value = true;
      update();
      try {
        final String url = ApiConstants.baseUrl +
            ApiConstants.updateUser +
            id; // Replace with your backend URL

        var request = http.MultipartRequest('PUT', Uri.parse(url));
        final file = selectedFile.value != null
            ? selectedFile.value!.files.single
            : null;
        if (file != null) {
          String fieldName = 'image';
          String fileName = file.path!.split("/").last;

          request.files.add(await http.MultipartFile.fromPath(
              fieldName, file.path!,
              filename: fileName));
        }
        request.fields['userName'] = userNameController.text;
        request.fields['identifiant'] = emailController.text;
        request.fields['oldPassword'] = oldPassController.text;
        request.fields['newPassword'] = newPassController.text;
        request.fields['phoneNumber'] = phoneController.text;
        request.fields['phonePassword'] = passPhoneController.text;

        var response = await request.send();
        var responseData = await response.stream.transform(utf8.decoder).join();
        var jsonResponse = jsonDecode(responseData);

        if (response.statusCode == 200) {
          final user = User.fromJson(jsonResponse['user']);
          _storage.write('id', user.id);
          _storage.write('userName', user.userName);
          _storage.write('identifiant', user.email);
          _storage.write('password', user.password);
          _storage.write('phoneNumber', user.phoneNumber);
          _storage.write('image', user.image);

          Get.snackbar('Success', 'User updated');
        } else if (response.statusCode == 401) {
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
          error.value = 'An error occurred while updating the user';
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
    id = _storage.read('id');
    username = _storage.read('userName');
    email = _storage.read('identifiant');
    phoneNumber = _storage.read('phoneNumber');
    userNameController.text = username;
    emailController.text = email;
    phoneController.text = phoneNumber;
    imageUrl = _storage.read('image');
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
