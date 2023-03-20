import 'package:flutter/material.dart';
import 'package:get/get.dart';

class category_Icon extends StatelessWidget {
  final double height;
  final double width;
  final Color secColor;
  final Color PrimaryColor;
final  String icon;
  final String Title;


  const category_Icon({
    Key? key,
    this.secColor = Colors.white,
    required this.PrimaryColor,
    required this.Title,
    required this.width,
    required this.height,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: secColor
            .withOpacity(1),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 2,
              blurStyle: BlurStyle.solid,
              offset: Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Title,style: TextStyle(
              color: PrimaryColor,
              fontFamily: "Poppins",
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(width: 5),
            Image.asset(icon,height: 30, width: 30)

          ],
        ),
      ),
    );
  }
}
