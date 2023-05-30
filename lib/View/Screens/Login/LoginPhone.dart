import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/PhoneloginController.dart';
import '../../shared_components/app_bar.dart';
import '../../shared_components/loading_overlay.dart';
import 'components/Button.dart';
import 'components/TextFieldLogin.dart';
import 'components/WelcomeText.dart';

class LoginPhone extends StatelessWidget {
  const LoginPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }
}

Widget _buildBody(BuildContext context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    Appbar(titleOn: true),
    WelcomeText(text: "Welcome to FixFlow!\n Sign in to continue"),
    Expanded(
      child: GetBuilder<PhoneController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
              key: controller.phoneFormKey,
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  physics: BouncingScrollPhysics(),
                  children: [
                    Text("Phone Number",
                        style: TextStyle(
                          color: Color.fromRGBO(84, 82, 82, 100),
                          fontFamily: 'Concert One',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 10),
                    TextFieldLogin(
                      controller: controller.numController,
                      icon: Icons.phone,
                      inputType: TextInputType.phone,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 3),
                    controller.isLoading.value
                        ? LoadingWidget()
                        : SubmitButton(
                            onSubmit: controller.getOTP, text: 'Get OTP')
                  ])),
        );
      }),
    ),
  ]);
}
