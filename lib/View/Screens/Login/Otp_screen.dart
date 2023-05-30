import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/otpcontroller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../shared_components/app_bar.dart';
import '../../shared_components/loading_overlay.dart';
import 'components/Button.dart';
import 'components/WelcomeText.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }
}

Widget _buildBody(BuildContext context) {
  return SingleChildScrollView(
    child: GetBuilder<OtpController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Appbar(titleOn: true),
          WelcomeText(text: "Please type the \nverification code "),
          Center(
            child: Image.asset('assets/OTP.png'),
          ),
          SizedBox(height: 20),
          Form(
            key: controller.otpFormKey,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: PinCodeTextField(
                validator: controller.validator,
                keyboardType: TextInputType.number,
                appContext: context,
                length: 4,
                onChanged: (value) => controller.setOtp(value),
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveColor: Color.fromRGBO(205, 205, 205, 100)),
              ),
            ),
          ),
          SizedBox(height: 16),
          controller.isLoading.value
              ? LoadingWidget()
              : SubmitButton(onSubmit: controller.verifyOtp, text: 'Verify OTP')
        ],
      );
    }),
  );
}
