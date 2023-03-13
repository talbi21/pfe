import 'package:get/get.dart';

import '../View/Screens/Login/NumPad_screen.dart';

class OtpController extends GetxController {
  var otp = ''.obs;

  void setOtp(String value) {
    otp.value = value;
  }

  void verifyOtp() {
    Get.to(() => NumPadscreen());
  }
}
