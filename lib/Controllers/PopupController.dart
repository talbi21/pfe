import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:untitled2/Controllers/TaskController.dart';
import '../View/Screens/Task/components/FixPopUp.dart';
import '../View/Screens/Task/components/ToArchivePopup.dart';
import '../data/api_constants.dart';
import '../model/TaskModel.dart';
import 'BottomNavigationController.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'HomeController.dart';

class PopupController extends GetxController {
  final Navcontroller = Get.put(BottomNavigationController());

  Rx<FilePickerResult?> selectedFile = Rx<FilePickerResult?>(null);
  final isLoading = false.obs;
  RxString Taskid ="".obs;

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

  void clearSelection() {
    selectedFile.value = null;
  }



  void openPopup(Task item) {
    Get.dialog(FixPopUp(task: item));
    Taskid.value = item.id;
  }


  void openArchivePopup() {
    Get.back();
    if (selectedFile.value == null) {
      Get.snackbar('Error', 'No file selected',backgroundColor: Colors.red.withOpacity(0.5),
          icon: const Icon(Icons.error, color: Colors.white),);
    } else {
      fix(Taskid.value);
     // await saveFile(selectedFile.value); // save the file
      clearSelection();
      Get.snackbar('Success', 'File saved');
    }
    //Get.dialog(ArchivePopup());

  }

  void closeArchivePopup() {
    Get.back();
    Navcontroller.changePage(0);
  }



  Future<void> fix(String taskId) async {
    Get.find<TaskController>().isLoading.value = true;
    update();
    try {

      final request = http.MultipartRequest(
        'POST',
        Uri.parse(ApiConstants.baseUrl + ApiConstants.FixTaskEndpoint + taskId),
      );




      final file = selectedFile.value != null ? selectedFile.value!.files.single : null;
      if (file != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'file',
            file.path!,
            filename: file.path!.split("/").last,
            contentType: MediaType('image', 'jpeg'),
          ),


        );
        print(file.path);

        final response = await request.send();

        if (response.statusCode == 200) {
          final data = json.decode(await response.stream.bytesToString());
          final Task updatedTask = Task.fromJson(data);

            final tasksController = Get.find<TaskController>();
            tasksController.tasks.removeWhere((task) => task.id == taskId);
            tasksController.tasks.add(updatedTask);
            print('File uploaded successfully');

        } else {
          print('Failed to upload file');
        }
      }
    } catch (err, _) {
      print("test4");
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
      Get.find<TaskController>().isLoading.value = false;
      update();
    }
  }




}

