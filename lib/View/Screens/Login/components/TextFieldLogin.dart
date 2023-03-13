import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/LoginController.dart';

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin({Key? key, required this.controller, required this.icon})
      : super(key: key);
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
              style: TextStyle(),
              controller: controller,
              validator: logincontroller.validator,
              decoration: InputDecoration(
                prefixIcon: Container(
                  width: 60,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(12, 62, 117, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      )),
                  child: Icon(icon, color: Colors.white, size: 30),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffF5F5F5))),
              )),
        ),
      ],
    );
  }
}
