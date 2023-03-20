import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/model/TaskModel.dart';

import '../../../../Controllers/TaskController.dart';
import 'Category_Icon.dart';

class Taskitem extends StatelessWidget {
  final Color secColor;
  final Color PrimaryColor;
  final TaskController controller;
  final VoidCallback  onSubmit;
  final String Title;
  final String Date;
  final String Description;
  final String status;
  final String type;
  final bool isVisible;


  const  Taskitem({
    Key? key,
    this.secColor = Colors.indigo,
    this.PrimaryColor = Colors.amber,
    required this.controller,
    required this.onSubmit,
    required this.Title,
    required this.Date,
    required this.Description,
    required this.status,
    required this.type, required this.isVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color.fromRGBO(241, 241, 241, 1),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                blurStyle: BlurStyle.solid,
                offset: Offset(0, 4)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color.fromRGBO(248, 245, 245, 1),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(204, 204, 204, 0.25),
                              blurRadius: 4,
                              blurStyle: BlurStyle.solid,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "AT",
                            style: TextStyle(
                                color: Color.fromRGBO(12, 62, 117, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              Title,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Icon(Icons.calendar_month,
                                    color: Color.fromRGBO(12, 62, 117, 1)),
                              ),
                              Text(
                                Date,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Icon(Icons.pin_drop,
                                    color: Color.fromRGBO(12, 62, 117, 1)),
                              ),
                              Text(
                                "Ariana, Tunis",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                    GestureDetector(
                      onTap: onSubmit,
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(12, 62, 117, 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(isVisible ? "Hide" : "Show",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),

                  )
                ],
              ),
              Text("Description",
                  style: TextStyle(
                      color: Color.fromRGBO(12, 62, 117, 1),
                      fontFamily: "Poppins",
                      fontSize: 14)),
              Text(
                "Et eodem impetu Domitianum praecipitem per scalas itidem funibus constrinxerunt, eosque coniunctos per ampla spatia"
                " civitatis acri raptavere discursu. iamque ",
              ),
              Visibility(
                    visible: isVisible,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Category",
                            style: TextStyle(
                                color: Color.fromRGBO(12, 62, 117, 1),
                                fontFamily: "Poppins",
                                fontSize: 14)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            category_Icon(
                              PrimaryColor: status == "To do"
                                  ? Color.fromRGBO(17, 154, 253, 1)
                                  : status == "In Progress"
                                      ? Color.fromRGBO(107, 119, 232, 1)
                                      : Color.fromRGBO(56, 232, 148, 1),
                              Title: status,
                              width: 60,
                              height: 25,
                              icon:


                              status == "To do"
                                  ?  'assets/to-do-list.png'
                                  : status == "In Progress"
                                  ?  'assets/settings.png'
                                  :  'assets/verify.png',
                            ),
                            SizedBox(width: 10),
                            category_Icon(
                              PrimaryColor: type == "Issue"
                                  ? Color.fromRGBO(51, 185, 239, 1)
                                  : Color.fromRGBO(151, 159, 239, 1),
                              Title:type,
                              width: 60,
                              height: 25,
                              icon:
                              type == "Issue"
                                  ?  'assets/maintenance.png'
                                  : 'assets/feature.png'
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("History"),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color.fromRGBO(
                                  56, 232, 148, 0.5), // text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // rounded corners
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 5),
                            ),
                            onPressed: () {},
                            child: Text(status == "To do"
                                ? "Start"
                                : status == "In Progress"
                                    ? "Fix"
                                    : "Archive"),
                          ),
                        )
                      ],
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
