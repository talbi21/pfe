import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import '../../../../model/TaskModel.dart';

class ArchiveItemHome extends StatelessWidget {
  final double height;
  final double width;
  final Color secColor;
  final Color primaryColor;
  final Task item;
  final Callback onDelete;

  const ArchiveItemHome({
    Key? key,
    this.secColor = Colors.indigo,
    this.primaryColor = Colors.amber,
    this.height = 140,
    this.width = 250,
    required this.item,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 30, bottom: 10),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: const Color.fromRGBO(241, 241, 241, 1),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              blurStyle: BlurStyle.solid,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    item.type == "Issue"
                        ? 'assets/maintenance.png'
                        : 'assets/feature.png',
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(65, 63, 63, 0.25),
                              blurRadius: 4,
                              blurStyle: BlurStyle.solid,
                            ),
                          ],
                        ),
                        child: const Center(
                            child: Text(
                          'AT',
                          style: TextStyle(
                              color: Color.fromRGBO(151, 159, 239, 1),
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(65, 63, 63, 0.25),
                            blurRadius: 4,
                            blurStyle: BlurStyle.solid,
                          ),
                        ],
                      ),
                      child: const Center(
                          child: Text(
                        'AT',
                        style: TextStyle(
                            color: Color.fromRGBO(151, 159, 239, 1),
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                item.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(Icons.calendar_month,
                        color: Color.fromRGBO(12, 62, 117, 1)),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    item.date,
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    width: 80,
                    height: 25,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(53, 97, 254, 0.25),
                        borderRadius: BorderRadius.circular(12.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset("assets/remove.png")
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
