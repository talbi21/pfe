import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumpadController extends GetxController {
  final numController = TextEditingController();

  void delete() async {
    if (!numController.text.isEmpty) {
      numController.text =
          numController.text.substring(0, numController.text.length - 1);
    }
  }

  void taper(String? value) async {
    numController.text = value!;
  }
}
