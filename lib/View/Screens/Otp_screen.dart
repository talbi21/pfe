import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/OtpController.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/appBar.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Appbar(),
            SizedBox(height: 20),
            Container(
              width: 250,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Text("Please type the \nverification code ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Concert One',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset('Assets/OTP.png'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: PinCodeTextField(
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
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 40),
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(12, 62, 117, 1), // text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // rounded corners
                ),
              ),
              onPressed: () => controller.verifyOtp(),
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
