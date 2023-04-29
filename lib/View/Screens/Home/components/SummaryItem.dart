import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SumItem extends StatelessWidget {
  final double height;
  final double width;
  final Color secColor;
  final Color PrimaryColor;
  final String Status;
  final String nbr;
  final String img;

  const SumItem({
    Key? key,
    this.secColor = Colors.indigo,
    this.PrimaryColor = Colors.amber,
    this.height = 140,
    this.width = 100,
    required this.Status,
    required this.nbr, required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: PrimaryColor,
            borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(Status,
            maxLines: 1,
            softWrap: false,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Oswald'
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(nbr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25
                )),
              ),
              Image.asset(img)
            ],
          )
        ],
      ),
    );
  }
}
