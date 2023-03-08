import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/Screens/Splash_screen.dart';
import 'bindings/all_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(MyBindings());
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      home: const SplashScreen(),
    );
  }
}
