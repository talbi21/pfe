import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../View/Screens/Task/components/FixPopUp.dart';
import '../View/Screens/Task/components/ToArchivePopup.dart';
import '../model/TaskModel.dart';
import 'BottomNavigationController.dart';

class PopupController extends GetxController {
  final Navcontroller = Get.put(BottomNavigationController());
  Rx<FilePickerResult?> selectedFile = Rx<FilePickerResult?>(null);

  Future<void> pickFile() async {
    selectedFile.value = await FilePicker.platform.pickFiles();
  }

  void clearSelection() {
    selectedFile.value = null;
  }



  void openPopup(Task item) {
    Get.dialog(FixPopUp(task: item));
  }


  void openArchivePopup() {
    Get.back();
    if (selectedFile.value == null) {
      Get.snackbar('Error', 'No file selected');
    } else {
     // await saveFile(selectedFile.value); // save the file
      clearSelection();
      Get.snackbar('Success', 'File saved');
    }
    Get.dialog(ArchivePopup());

  }

  void closeArchivePopup() {
    Get.back();
    Navcontroller.changePage(0);
  }
}

