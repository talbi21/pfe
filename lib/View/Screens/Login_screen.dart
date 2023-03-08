import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../Controllers/LoginController.dart';
import '../widgets/appBar.dart';
import '../widgets/loading_overlay.dart';
import 'LoginPhone.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Appbar(),
        SizedBox(height: 20),
        Container(
          width: 250,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Text("Welcome to FixFlow!\n Sign in to continue",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Concert One',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: 50,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
                key: controller.loginFormKey,
                child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    physics: BouncingScrollPhysics(),
                    children: [
                      Text("Identifiant",
                          style: TextStyle(
                            color: Color.fromRGBO(84, 82, 82, 100),
                            fontFamily: 'Concert One',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                                style: TextStyle(
                                ),
                                controller: controller.idController,
                                validator: controller.validator,
                                decoration: InputDecoration(
                                  prefixIcon: Container(
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(12, 62, 117, 1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        )),
                                    child: Icon(Icons.account_circle_outlined,
                                        color: Colors.white, size: 30),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                      BorderSide(color: Color(0xffF5F5F5))),
                                )),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text("Password",
                          style: TextStyle(
                            color: Color.fromRGBO(84, 82, 82, 100),
                            fontFamily: 'Concert One',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                                controller: controller.passController,
                                validator: controller.validator,
                                decoration: InputDecoration(
                                  prefixIcon: Container(
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(12, 62, 117, 1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        )),
                                    child: Icon(Icons.lock,
                                        color: Colors.white, size: 30),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                      BorderSide(color: Color(0xffF5F5F5))),
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: 20),

                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => LoginPhone());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Center(
                            child: Container(
                              width: 200,
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Login with Phone Number",
                                      style: TextStyle(
                                        color:
                                        Color.fromRGBO(119, 113, 113, 113),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.phone)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 40),
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromRGBO(12, 62, 117, 1), // text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // rounded corners
                          ),
                        ),
                        onPressed: () async {
                          if (controller.loginFormKey.currentState!
                              .validate()) {
                            LoadingOverlay.show(message: 'Login...');
                            try {
                              await

                              Timer(Duration(seconds:5), () {
                                controller.login();
                              });

                              //   Get.offAllNamed(Routes.HOME);
                              print("done");
                            } catch (err, _) {
                              printError(info: err.toString());
                              LoadingOverlay.hide();
                              Get.snackbar(
                                "Error",
                                err.toString(),
                                snackPosition: SnackPosition.TOP,
                                backgroundColor:
                                Colors.red.withOpacity(.75),
                                colorText: Colors.white,
                                icon: const Icon(Icons.error,
                                    color: Colors.white),
                                shouldIconPulse: true,
                                barBlur: 20,
                              );
                            } finally {}

                            controller.loginFormKey.currentState!.save();
                          }
                        },
                        child: const Text('Login'),
                      ),
                      /*GestureDetector(
                        onTap: () async {
                          if (controller.loginFormKey.currentState!
                              .validate()) {
                            LoadingOverlay.show(message: 'Login...');
                            try {
                              await controller.login();
                           //   Get.offAllNamed(Routes.HOME);
                              print("done");
                            } catch (err, _) {
                              printError(info: err.toString());
                              LoadingOverlay.hide();
                              Get.snackbar(
                                "Error",
                                err.toString(),
                                snackPosition: SnackPosition.TOP,
                                backgroundColor:
                                Colors.red.withOpacity(.75),
                                colorText: Colors.white,
                                icon: const Icon(Icons.error,
                                    color: Colors.white),
                                shouldIconPulse: true,
                                barBlur: 20,
                              );
                            } finally {}

                            controller.loginFormKey.currentState!.save();
                          }
                        },
                        child: Container(
                          width: 10,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(12, 62, 117, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              )),
                          child: Center(
                            child: Text("Login",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      )*/
                    ])),
          ),
        ),
      ]),
    );
  }


}
