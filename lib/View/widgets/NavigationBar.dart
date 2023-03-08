import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Controllers/BottomNavigationController.dart';

import '../Screens/Home_screen.dart';
import '../Screens/Otp_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex ;
  final BottomNavigationController controller ;
  final bool isActive;

  const CustomBottomNavigationBar({
    Key? key, required this.selectedIndex, required this.controller,required this.isActive
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.0,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        /*boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],*/
      ),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            right: 15,
            bottom: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.archive, selectedIndex == 1
                    ? 'Archive'
                    : selectedIndex == 2
                    ? 'Archive'
                    : '', 0),
                SizedBox(width: 50),
                _buildNavItem(Icons.home, selectedIndex == 1
                    ? ''
                    : selectedIndex == 2
                    ? 'Home'
                    : 'Home', 1),
                SizedBox(width: 50),
                _buildNavItem(Icons.person, selectedIndex == 1
                    ? 'Profile'
                    : selectedIndex == 2
                    ? ''
                    : 'Profile', 2),
              ],
            ),
          ),
          isActive ?
          Positioned(
            left: 0,
            right: 0,
            bottom: 15,
            child: AnimatedAlign(
              alignment: selectedIndex == 1
                  ? Alignment.center
                  : selectedIndex == 2
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
              child: Container(
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(12, 62, 117, 1),
                ),
                child: IconButton(
                  icon: Icon(selectedIndex == 1
                      ? Icons.home
                      : selectedIndex == 2
                      ? Icons.person
                      : Icons.archive),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ),
          ):SizedBox()

        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap:()=>controller.changePage(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: selectedIndex == index ? Colors.blue : Color.fromRGBO(
                12, 62, 117, 1),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.blue : Color.fromRGBO(
                    12, 62, 117, 1)
            ),
          ),
        ],
      )
    );

  }


}
