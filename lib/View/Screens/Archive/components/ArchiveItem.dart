import 'package:flutter/material.dart';

import '../../../../model/TaskModel.dart';

class ArchiveItem extends StatelessWidget {
  final double height;
  final double width;
  final Color secColor;
  final Color PrimaryColor;
  final Task item;
  final VoidCallback  onDelete;
  final VoidCallback  onDownload;

  const ArchiveItem({
    Key? key,
    this.secColor = Colors.indigo,
    this.PrimaryColor = Colors.amber,
    this.height = 140,
    this.width = 250,
    required this.item,
    required this.onDelete,
    required this.onDownload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
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
                          child: Image.asset(item.type == "Issue"
                              ?  'assets/maintenance.png'
                              : 'assets/feature.png',
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              item.title,
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
                                item.date,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(65, 63, 63, 0.25),
                                blurRadius: 4,
                                blurStyle: BlurStyle.solid,
                              ),
                            ],
                          ),
                          child: Center(child: Text('AT',
                            style: TextStyle(
                                color: Color.fromRGBO(151, 159, 239, 1),
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                fontWeight: FontWeight.bold ),
                          )
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(65, 63, 63, 0.25),
                              blurRadius: 4,
                              blurStyle: BlurStyle.solid,
                            ),
                          ],
                        ),
                        child: Center(child: Text('AT',
                          style: TextStyle(
                              color: Color.fromRGBO(151, 159, 239, 1),
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.bold ),
                        )
                        ),
                      )
                    ],
                  )
                ],
              ),
             SizedBox(height: 30),
              Text(
                item.description,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: onDelete,
                        child: Container(
                          width:110 ,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(53, 97, 254, 0.25),
                              borderRadius: BorderRadius.circular(12.5)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Delete",
                                style: TextStyle(
                                  fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset("assets/remove.png")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: onDownload,
                        child: Container(
                          width:110,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(56, 235, 148, 0.5),
                              borderRadius: BorderRadius.circular(12.5)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Download",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                             Icon(Icons.attach_file,color: Colors.white,size: 20,)
                            ],
                          ),
                        ),
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
