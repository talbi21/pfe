import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controllers/ProfileController.dart';

class AboutContainer extends StatelessWidget{

  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: controller.isToggleOn.value,
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 5),
                /*Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color.fromRGBO(241, 241, 241, 1)
                        .withOpacity(0.75),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.25),
                          blurRadius: 4,
                          blurStyle: BlurStyle.solid,
                          offset: Offset(0, 4)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("PHONE",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(107, 115, 121, 1),
                            )),
                        Text(
                          controller.phoneNumber.value,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color.fromRGBO(159, 173, 187, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),*/
                SizedBox(height: 5),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color.fromRGBO(241, 241, 241, 1)
                        .withOpacity(0.75),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.25),
                          blurRadius: 4,
                          blurStyle: BlurStyle.solid,
                          offset: Offset(0, 4)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("DEPARTEMENT",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(107, 115, 121, 1),
                            )),
                        Text(
                          "Technique",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color.fromRGBO(159, 173, 187, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color.fromRGBO(241, 241, 241, 1)
                        .withOpacity(0.75),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.25),
                          blurRadius: 4,
                          blurStyle: BlurStyle.solid,
                          offset: Offset(0, 4)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Joined",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(107, 115, 121, 1),
                            )),
                        Text(
                          controller.dateJoined.value,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color.fromRGBO(159, 173, 187, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      );
    });
  }

}