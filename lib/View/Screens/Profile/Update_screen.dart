import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/data/api_constants.dart';

import '../../../Controllers/UpdateController.dart';
import '../../shared_components/appBar.dart';
import '../Login/components/Button.dart';
import '../Login/components/TextFieldLogin.dart';
import 'components/UpdateSkeleton.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({Key? key}) : super(key: key);

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
      _buildUpdateForm()
    ],
  );
}

Widget _buildUpdateForm() {
  final controller = Get.put(UpdateController());

  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GetBuilder<UpdateController>(builder: (controller) {
        if (controller.isLoading.value) {
          return UpdateSkeleton();

        } else
          return Form(
          key: controller.updateFormKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: GestureDetector(
                  onTap: controller.pickFile,
                  child: CircleAvatar(
                    radius: 45,
                    child: ClipOval(
                      child: controller.imageUrl != ""
                          ? Image.network(
                        ApiConstants.baseUrl+controller.imageUrl!,
                        fit: BoxFit.fill,
                        height: 90,
                        width: 90,
                      )
                          : Image.asset(
                        "assets/avatar.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Update User Information",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controller.userNameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.account_circle_outlined,
                    color: Color.fromRGBO(12, 62, 117, 1),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: controller.validator,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_outlined,
                    color: Color.fromRGBO(12, 62, 117, 1),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: controller.validator,
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                controller: controller.oldPassController,
                decoration: InputDecoration(
                  labelText: "Old Password",
                  prefixIcon: Icon(Icons.lock_outline,
                    color: Color.fromRGBO(12, 62, 117, 1),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: controller.validator,
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                controller: controller.newPassController,
                decoration: InputDecoration(
                  
                  labelText: "New Password",
                  prefixIcon: Icon(Icons.lock_outline,
                    color: Color.fromRGBO(12, 62, 117, 1),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: controller.validator,

              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                controller: controller.confirmPassController,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: Icon(Icons.lock_outline,
                    color: Color.fromRGBO(12, 62, 117, 1),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator:controller.confirmvalidator,
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: controller.phoneController,
                decoration: InputDecoration(

                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone_outlined,
                    color: Color.fromRGBO(12, 62, 117, 1),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: controller.validator,

              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                obscureText: true,
                controller: controller.passPhoneController,
                decoration: InputDecoration(
                  labelText: "Phone Password",
                  prefixIcon: Icon(Icons.lock_outline,
                    color: Color.fromRGBO(12, 62, 117, 1),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: controller.validatorPass,
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                controller: controller.confirmPhonePassController,
                decoration: InputDecoration(
                  labelText: "Confirm Phone Password",
                  prefixIcon: Icon(Icons.lock_outline,
                    color: Color.fromRGBO(12, 62, 117, 1),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator:controller.confirmphonevalidator,
              ),
              SizedBox(height: 30),

              SubmitButton(onSubmit: () => controller.updateUser(), text: 'Update'),

            ],
          ),
        );
      }),
    ),
  );
}

