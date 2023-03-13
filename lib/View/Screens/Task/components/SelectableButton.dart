import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectableButton extends StatelessWidget {
  final double height;
  final double width;
  final Color secColor;
  final Color PrimaryColor;
  final  String icon;
  final String Title;
  final bool isSelected;
  final VoidCallback onPressed;

  const SelectableButton({
    Key? key,
    this.secColor = Colors.indigo,
    required this.PrimaryColor,
    required this.Title,
    required this.width,
    required this.height,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Color.fromRGBO(241, 241, 241, 1)
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
      ),
    );
  }
}