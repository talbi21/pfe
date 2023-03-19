import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/NumpadController.dart';
import '../../shared_components/appBar.dart';
import 'components/numpad.dart';
import '../dashboard.dart';
import 'components/WelcomeText.dart';

class NumPadscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }
}

Widget _buildBody() {
  final controller = Get.put(NumpadController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Appbar(TitleOn: true),
      SizedBox(height: 10),
      WelcomeText(text: "Please type your \npassword"),
      Center(
        child: Image.asset('assets/passwordimg.png'),
      ),
      SizedBox(height: 20),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // display the entered numbers
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 30,
              child: Center(
                  child: TextField(
                controller: controller.numController,
                textAlign: TextAlign.center,
                showCursor: false,
                style: const TextStyle(fontSize: 40),
                // Disable the default soft keybaord
                keyboardType: TextInputType.none,
              )),
            ),
          ),
          // implement the custom NumPad
          NumPad(
            buttonSize: 60,
            buttonColor: Colors.white,
            iconColor: Colors.white,
            controller: controller.numController,
            delete: () {
              controller.delete();
            },
            // do something with the input numbers
            onSubmit: () {
              Get.offAll(() => HomeScreen());
              //  Get.to(() => HomePage());
              /*showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: Text(
                      "You code is "+controller.numController.text,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ));*/
            },
          ),
        ],
      ),
    ],
  );
}