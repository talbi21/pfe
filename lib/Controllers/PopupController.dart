import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:untitled2/Controllers/TaskController.dart';
import '../View/Screens/Task/components/FixPopUp.dart';
import '../data/api_constants.dart';
import '../model/TaskModel.dart';
import 'bottomNavigationController.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class PopupController extends GetxController {
  final navController = Get.put(BottomNavigationController());
  final GlobalKey<FormState> popUpFormKey =
      GlobalKey<FormState>(debugLabel: '__PopUpFormKey__');

  Rx<FilePickerResult?> selectedFile = Rx<FilePickerResult?>(null);
  final isLoading = false.obs;
  RxString taskId = "".obs;
  final descController = TextEditingController();

  String? validator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
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
      Get.snackbar(
        'Error',
        'No file selected',
        backgroundColor: Colors.red.withOpacity(0.5),
        icon: const Icon(Icons.error, color: Colors.white),
      );
    }
  }

  void clearSelection() {
    selectedFile.value = null;
  }

  void openPopup(Task item) {
    Get.dialog(FixPopUp(task: item));
    taskId.value = item.id;
  }

  void openArchivePopup() {
    if (popUpFormKey.currentState!.validate()) {
      if (selectedFile.value == null) {
        Get.snackbar(
          'Error',
          'No file selected',
          backgroundColor: Colors.red.withOpacity(0.5),
          icon: const Icon(Icons.error, color: Colors.white),
        );
      } else {
        fix(taskId.value);
        Get.back();
        // await saveFile(selectedFile.value); // save the file
        clearSelection();
        Get.snackbar('Success', 'File saved');
      }
    }
  }


  Future<void> fix(String taskId) async {
      Get.find<TaskController>().isLoading.value = true;
      Get.find<TaskController>().update();
      try {
        final request = http.MultipartRequest(
          'POST',
          Uri.parse(
              ApiConstants.baseUrl + ApiConstants.fixTaskEndpoint + taskId),
        );

        request.fields['description'] = descController.text;

        final file = selectedFile.value != null
            ? selectedFile.value!.files.single
            : null;
        if (file != null) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'file',
              file.path!,
              filename: file.path!.split("/").last,
              contentType: MediaType('image', 'jpeg'),
            ),
          );

          final response = await request.send();

          if (response.statusCode == 200) {
            final data = json.decode(await response.stream.bytesToString());
            final Task updatedTask = Task.fromJson(data);

            final tasksController = Get.find<TaskController>();
            tasksController.tasks.removeWhere((task) => task.id == taskId);
            tasksController.tasks.add(updatedTask);
            Get.back();
          } else {
          }
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
        Get.find<TaskController>().isLoading.value = false;
        Get.find<TaskController>().update();
      }

  }
}
