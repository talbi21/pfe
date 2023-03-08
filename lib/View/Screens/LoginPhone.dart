import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/PhoneloginController.dart';
import '../widgets/appBar.dart';
import 'Otp_screen.dart';

class LoginPhone extends StatelessWidget {
  const LoginPhone({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneController());
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
                key: controller.PhoneFormKey,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                                style: TextStyle(

                                ),

                                controller: controller.numController,
                                validator: controller.validator,
                                decoration: InputDecoration(

                                  prefixIcon: Container(
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(12, 62, 117, 1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        )),
                                    child: Icon(Icons.phone,
                                        color: Colors.white, size: 30),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                      BorderSide(color: Color(0xffF5F5F5))),

                                )
                            ),
                          )
                        ],
                      ),


                      SizedBox(height: MediaQuery.of(context).size.height/3),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 40),
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromRGBO(12, 62, 117, 1), // text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // rounded corners
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => OtpPage());
                        },
                        child: Text('Get OTP'),
                      ),


                    ]

                )
            ),
          ),
        ),
      ]
      ),
    );
  }
}
