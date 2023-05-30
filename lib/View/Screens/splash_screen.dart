import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/SplashController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset('assets/logo.png',
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    height: 350,
                    width: 350),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  width: 120,
                  height: 120,
                  'assets/mss.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ));
  }
  // Add your properties and methods here
}
