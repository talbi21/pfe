import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class  Appba extends StatelessWidget {
  const Appba({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Stack(
          children: <Widget>[
            Positioned(
                top: -60,
                left: -50,
                child: Transform.rotate(
                  angle: 15 * (math.pi / 180),
                  child: Container(
                      width: 408,
                      height: MediaQuery
                          .of(context)
                          .size
                          .width / 2,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(229, 229, 229, 1),
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(508, 203)),
                      )
                  ),
                )
            ), Positioned(
                top: -60,
                left: MediaQuery
                    .of(context)
                    .size
                    .width / 5,
                child: Transform.rotate(
                  angle: 15 * (math.pi / 180),
                  child: Container(

                      width: 375,
                      height: MediaQuery
                          .of(context)
                          .size
                          .width / 2,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(12, 62, 117, 1),
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(375, 167)),
                      )
                  ),
                )
            ),
          ]
      ),


    );
  }

}