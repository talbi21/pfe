import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/ProfileController.dart';
import 'components/About.dart';
import 'components/ProfileTaskItem.dart';
import '../../shared_components/appBar.dart';

class ProfilePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Appbar(TitleOn: true),
          _buildProfileContainer(),
          _buildChoiceContainer(),
          _buildWorkContainer(context),
          AboutContainer()
        ],
      ),
    );
  }
}



Widget _buildWorkContainer(BuildContext context) {
  final controller = Get.put(ProfileController());
  return  Obx(() {
    return Visibility(
      visible: !controller.isToggleOn.value,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileTaskitem(
                        nbr: controller.IssuesDone(),
                        Title: "Issues Done",
                        colorr: Color.fromRGBO(44, 203, 215, 1)),
                    ProfileTaskitem(
                        nbr: controller.FeaturesDone(),
                        Title: "Features Done",
                        colorr: Color.fromRGBO(44, 203, 215, 1))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileTaskitem(
                        nbr: controller.HoursWorkedCount(),
                        Title: "Hours  worked",
                        colorr: Color.fromRGBO(253, 159, 61, 1)),
                    ProfileTaskitem(
                        nbr: controller.InprogressCount(),
                        Title: "Tasks In Progress",
                        colorr: Color.fromRGBO(65, 117, 255, 1))
                  ],
                ),
              ],
            ),
          )),
    );
  });
}

Widget _buildProfileContainer(){
  return  Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color.fromRGBO(241, 241, 241, 1),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              blurStyle: BlurStyle.solid,
              offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 10, right: 5, bottom: 10, top: 10),
            child: Image.asset("assets/exempleuser.jpg",
                height: 87, width: 84),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.only(top: 10, bottom: 5, left: 1),
                child: Text(
                  "Achref Talbi",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 0.5),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.mail,
                    size: 20,
                    color: Color.fromRGBO(12, 62, 117, 1),
                  ),
                  SizedBox(width: 10),
                  Text("achref.talbi@esprit.tn")
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 20,
                    color: Color.fromRGBO(12, 62, 117, 1),
                  ),
                  SizedBox(width: 10),
                  Text("Mai, 10, 1998")
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.pin_drop,
                    size: 20,
                    color: Color.fromRGBO(12, 62, 117, 1),
                  ),
                  SizedBox(width: 10),
                  Text("Marsa, Tunis")
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget _buildChoiceContainer() {
  final controller = Get.put(ProfileController());
  return
  Obx(() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Color.fromRGBO(241, 241, 241, 1),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              blurStyle: BlurStyle.solid,
              offset: Offset(0, 4)),
        ],
      ),
      width: 130,
      height: 40,
      child: Stack(
        children: [
          Positioned(
            left: controller.isToggleOn.value ? 0 : 56,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(12, 62, 117, 1),
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15, bottom: 10, top: 10, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => controller.toAbout(),
                    child: Text(
                      "ABOUT",
                      style: TextStyle(
                        color: controller.isToggleOn.value
                            ? Colors.white
                            : Color.fromRGBO(65, 117, 255, 1),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.toWork(),
                    child: Text(
                      "WORK",
                      style: TextStyle(
                        color: controller.isToggleOn.value
                            ? Color.fromRGBO(65, 117, 255, 1)
                            : Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  });
}