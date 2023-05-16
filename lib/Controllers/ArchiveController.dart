import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data/api_constants.dart';
import '../model/TaskModel.dart';

class ArchiveController extends GetxController {

  var tasks = RxList<Task>().obs;
  final _storage = GetStorage();
  final isLoading = false.obs;
  RxString id ="".obs;




  @override
  void onInit() {
    id.value  = _storage.read('id');
   // fetchItems();
    FlutterDownloader.registerCallback(callback);
    super.onInit();
  }



  void removeTaskById(String id) {
    tasks.value.removeWhere((task) => task.id == id);
  }

  Future<bool> DeleteItem(String id) async {
    isLoading.value = true;
    update();

    try {
      final String url = ApiConstants.baseUrl + ApiConstants.DeleteArchiveTaskEndpoint + id;
      final http.Response response = await http.delete(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successful deletion
        print("Item deleted successfully");
        removeTaskById(id);
        isLoading.value = false;
        update();
        return true;
      } else if (response.statusCode == 500) {
        final responseData = json.decode(response.body);
        // Show error message using Get.snackbar or any other appropriate method
        // ...
        isLoading.value = false;
        update();
        return false;
      } else {
        // Handle other status codes if needed
        final responseData = json.decode(response.body);
        // Show error message using Get.snackbar or any other appropriate method
        // ...
        isLoading.value = false;
        update();
        return false;
      }
    } catch (err, _) {
      // Handle network errors or other exceptions
      print(err);
      // Show error message using Get.snackbar or any other appropriate method
      // ...
      isLoading.value = false;
      update();
      return false;
    }
  }


  void fetchItems() async {

    isLoading.value = true;
    try {

      final String url = ApiConstants.baseUrl+ApiConstants.findArchiveTasksEndpoint+id.value; // Replace with your backend URL
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successful login

        final data = json.decode(response.body);
        final taskList = (data['tasks'] as List<dynamic>).map((e) => Task.fromJson(e as Map<String, dynamic>)).toList();
        tasks.value.clear();
        tasks.value.addAll(taskList);
        print(taskList);




      } else if (response.statusCode == 401) {

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





      } else {


        final responseData = json.decode(response.body);
        // error.value = responseData['message'];
        print(responseData);
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

      print(err);
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


    }finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> downloadAttachment(String id, String fileName) async {
    isLoading.value = true;
    update();
    // Check if permission is already granted
    PermissionStatus status = await Permission.storage.status;
    if (!status.isGranted) {
      // Request storage permission
      print('ask');
      status = await Permission.storage.request();
      if (!status.isGranted) {
        // Permission denied, handle accordingly (show error message, etc.)
        print('no');
        return;
      }
    }

    final appDir = await getApplicationDocumentsDirectory();
    final downloadDir = '${appDir.path}/Download';
    final savePath = '$downloadDir/$fileName';

    final directory = Directory(downloadDir);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    // Register the callback function before starting the download
    FlutterDownloader.registerCallback(callback);

    final taskId = await FlutterDownloader.enqueue(
      url: ApiConstants.baseUrl + ApiConstants.downloadAttatechmantEndpoint + id,
      savedDir: downloadDir,
      fileName: fileName,
      showNotification: true,
      openFileFromNotification: true,
    );


    isLoading.value = false;
    update();
  }







}
void callback(String id, int status, int progress) {
  if (status == DownloadTaskStatus.complete) {
    print('Attachment downloaded successfully.');
    // Handle success
  } else if (status == DownloadTaskStatus.failed) {
    print('Failed to download attachment.');
    // Handle failure
  }
}

