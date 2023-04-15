import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/PhoneloginController.dart';
import '../../../Controllers/UpdatePasswordController.dart';
import '../../shared_components/appBar.dart';
import 'components/Button.dart';
import 'components/TextFieldLogin.dart';
import 'components/WelcomeText.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }
}

Widget _buildBody(BuildContext context) {
  final controller =  Get.put(UpdatePasswordController());

  return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    Appbar(TitleOn: true),
    WelcomeText(text: "Welcome to FixFlow!\n Sign in to continue"),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
            key: controller.PasswordFormKey,
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                physics: BouncingScrollPhysics(),
                children: [
                  Text("Old Password",
                      style: TextStyle(
                        color: Color.fromRGBO(84, 82, 82, 100),
                        fontFamily: 'Concert One',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 10),
                  Obx(() {
                    return TextFormField(
                        obscureText: controller.isOldObscured.value,
                        style: TextStyle(),
                        controller: controller.oldPassController,
                        validator: controller.validator,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: controller.isOldObscured.value ? Icon(
                                Icons.visibility) : Icon(
                                Icons.visibility_off),
                            onPressed: () {
                              controller.isOldObscured.value =
                              !controller.isOldObscured.value;
                            },
                          ),
                          prefixIcon: Container(
                            width: 60,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(12, 62, 117, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                )),
                            child: Icon(
                                Icons.lock, color: Colors.white, size: 30),
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Color(0xffF5F5F5))),
                        )
                    );
                  }),
                  SizedBox(height: 20),
                  Text("New Password",
                      style: TextStyle(
                        color: Color.fromRGBO(84, 82, 82, 100),
                        fontFamily: 'Concert One',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 10),
                  Obx(() {
                    return TextFormField(
                        obscureText: controller.isNewObscured.value,
                        style: TextStyle(),
                        controller: controller.newPasController,
                        validator: controller.validator,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: controller.isNewObscured.value ? Icon(
                                Icons.visibility) : Icon(
                                Icons.visibility_off),
                            onPressed: () {
                              controller.isNewObscured.value =
                              !controller.isNewObscured.value;
                            },
                          ),
                          prefixIcon: Container(
                            width: 60,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(12, 62, 117, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                )),
                            child: Icon(
                                Icons.lock, color: Colors.white, size: 30),
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Color(0xffF5F5F5))),
                        )
                    );
                  }),
                  SizedBox(height: 20),
                  Text("Confirm Password",
                      style: TextStyle(
                        color: Color.fromRGBO(84, 82, 82, 100),
                        fontFamily: 'Concert One',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 10),
                  Obx(() {
                    return TextFormField(
                        obscureText: controller.isConfirmObscured.value,
                        style: TextStyle(),
                        controller: controller.confirmPassController,
                        validator: controller.confirmvalidator,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: controller.isConfirmObscured.value ? Icon(
                                Icons.visibility) : Icon(
                                Icons.visibility_off),
                            onPressed: () {
                              controller.isConfirmObscured.value =
                              !controller.isConfirmObscured.value;
                            },
                          ),
                          prefixIcon: Container(
                            width: 60,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(12, 62, 117, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                )),
                            child: Icon(
                                Icons.lock, color: Colors.white, size: 30),
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Color(0xffF5F5F5))),
                        )
                    );
                  }),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height / 5.5),
                  SubmitButton(onSubmit:controller.UpdatePassword, text: 'Update')
                ])),
      ),
    ),
  ]);
}
