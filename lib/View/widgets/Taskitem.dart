import 'dart:ffi';

import 'package:flutter/material.dart';

import 'Archiveitem.dart';

class Taskitem extends StatelessWidget {
  final Color secColor;
  final Color PrimaryColor;
  final bool show;

  const Taskitem({
    Key? key,
    this.secColor = Colors.indigo,
    this.PrimaryColor = Colors.amber,
    this.show = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color.fromRGBO(241, 241, 241, 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(203, 191, 191, 0.25),
              blurRadius: 4,
              blurStyle: BlurStyle.solid,
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
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "Test 1",
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
                                "12 July 2023",
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
                  Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(12, 62, 117, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(show ? "Hide" : "Show",
                          style: TextStyle(color: Colors.white)),
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
                  visible: show,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Category",
                          style: TextStyle(
                              color: Color.fromRGBO(12, 62, 117, 1),
                              fontFamily: "Poppins",
                              fontSize: 14)),

                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Row(children: [
                              Text(
                                "To Do",
                              ),
                              Icon(Icons.today_outlined)
                            ]),
                          )
                        ],
                      ),
                      Divider(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("History"),
                          Icon(Icons.arrow_drop_down)
                        ],
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
