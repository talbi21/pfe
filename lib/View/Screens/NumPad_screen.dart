import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/NumpadController.dart';
import '../widgets/appBar.dart';
import '../widgets/numpad.dart';
import 'Home_screen.dart';
import 'dashboard.dart';

class NumPadscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NumpadController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Appbar(),
          SizedBox(height: 10),
          Container(
            width: 250,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Text("Please type your \npassword",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Concert One',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Image.asset('Assets/OTP.png'),
          ),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // display the entered numbers
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height) / 60,
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
                  Get.to(HomeScreen());
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
      ),
    );
  }
}
