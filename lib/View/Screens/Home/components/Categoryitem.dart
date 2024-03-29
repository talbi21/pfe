import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final double height;
  final double width;
  final Color secColor;
  final Color primaryColor;
  final void Function()? onSubmit;
  final String title;
  final String nbr;

  const CategoryItem({
    Key? key,
    this.secColor = Colors.indigo,
    required this.primaryColor,
    required this.onSubmit,
    required this.title,
    required this.nbr,
    this.height = 50,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSubmit,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: TextStyle(
                        color: secColor,
                        fontFamily: 'Poppins',
                        fontSize: 30,
                      )),
                  Icon(Icons.arrow_forward, color: secColor)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 15),
              child: Text("$nbr  Tasks available",
                  style: TextStyle(
                    color: secColor,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
