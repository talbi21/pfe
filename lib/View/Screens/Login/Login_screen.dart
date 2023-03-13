import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../../Controllers/LoginController.dart';
import '../../shared_components/appBar.dart';
import 'components/Button.dart';
import 'components/TextFieldLogin.dart';
import 'components/WelcomeText.dart';
import 'LoginPhone.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}


Widget _buildBody() {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Appbar(TitleOn: true),
      WelcomeText(text: "Welcome to FixFlow!\n Sign in to continue"),
      _buildLoginForm()
    ],
  );
}

Widget _buildLoginForm() {
  final controller = Get.put(LoginController());
  return Expanded(
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
              TextFieldLogin(
                  controller: controller.idController,
                  icon: Icons.account_circle_outlined),
              SizedBox(height: 20),
              Text("Password",
                  style: TextStyle(
                    color: Color.fromRGBO(84, 82, 82, 100),
                    fontFamily: 'Concert One',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 10),
              TextFieldLogin(
                  controller: controller.passController, icon: Icons.lock),
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
                                color: Color.fromRGBO(119, 113, 113, 113),
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
              SubmitButton(onSubmit: controller.login, text: 'Login')
            ]),
      ),
    ),
  );
}


