import 'package:flutter/material.dart';

class SumItem extends StatelessWidget {
  final double height;
  final double width;
  final Color secColor;
  final Color primaryColor;
  final String status;
  final String nbr;
  final String img;
  final void Function()? onSubmit;

  const SumItem({
    Key? key,
    this.secColor = Colors.indigo,
    this.primaryColor = Colors.amber,
    this.height = 140,
    this.width = 100,
    required this.onSubmit,
    required this.status,
    required this.nbr,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSubmit,
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(status,
                  maxLines: 1,
                  softWrap: false,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(nbr,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 25)),
                ),
                Image.asset(img)
              ],
            )
          ],
        ),
      ),
    );
  }
}
