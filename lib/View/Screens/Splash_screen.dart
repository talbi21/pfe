import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../Controllers/SplashController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('Assets/logo.png',
              fit: BoxFit.scaleDown, alignment: Alignment.center),
        ));
  }
  // Add your properties and methods here
}
