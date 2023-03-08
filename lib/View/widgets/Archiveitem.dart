import 'package:flutter/material.dart';

class ArchiveItem extends StatelessWidget {
  final double height;
  final double width;
  final Color secColor;
  final Color PrimaryColor;
  final Task item;



  const ArchiveItem({
    Key? key,
    this.secColor = Colors.indigo,
    this.PrimaryColor = Colors.amber,

     this.height= 140,
     this.width= 250,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( right: 30),
      height: height,
      width: width,
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                   width: 50,
                  height:50 ,
                  child: Icon(item.icon,
                    size: 40,
                    color: Colors.yellow,
                ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(item.title,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                    fontWeight: FontWeight.bold ),),
            ),
          ),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Icon(Icons.calendar_month,
                    color: Color.fromRGBO(12, 62, 117, 1)),
              ),

              Text(item.description,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5)
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  width:80 ,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(53, 97, 254, 0.25),
                    borderRadius: BorderRadius.circular(12.5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Delete",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset("Assets/remove.png")
                    ],
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


class Task {
  final String title;
  final String description;
  final IconData icon;

  const Task({required this.title, required this.description, required this.icon});
}