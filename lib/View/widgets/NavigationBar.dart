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
      height: 85,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.white],
          stops: [0.3, 0.2],
        ),
      //  color: Colors.white.withOpacity(0.5),
        /*boxShadow: [
          BoxShadow(
            color: Colors.white54,
            blurRadius: 2.0,
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
                _buildNavItem(AssetImage('Assets/iconArchieve.png'), selectedIndex == 1
                    ? 'Archive'
                    : selectedIndex == 2
                    ? 'Archive'
                    : '', 0),
                _buildNavItem(AssetImage('Assets/iconHome.png'), selectedIndex == 1
                    ? ''
                    : selectedIndex == 2
                    ? 'Home'
                    : 'Home', 1),
                _buildNavItem(AssetImage('Assets/iconProfile.png'), selectedIndex == 1
                    ? 'Profile'
                    : selectedIndex == 2
                    ? ''
                    : 'Profile', 2),
              ],
            ),
          ),
          isActive ?
          Positioned(
            left: 20,
            right: 20,
            bottom: 25,
            child: AnimatedAlign(
              alignment: selectedIndex == 1
                  ? Alignment.center
                  : selectedIndex == 2
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
              child: Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(12, 62, 117, 1),
                ),
                child:Image.asset(selectedIndex == 1
                    ? "Assets/iconHome.png"
                    : selectedIndex == 2
                    ? "Assets/iconProfile.png"
                    : "Assets/iconArchieve.png",width: 30,height: 30,
                color: Colors.white,)


                /*IconButton(
                  icon: Icon(selectedIndex == 1
                      ? Icons.home
                      : selectedIndex == 2
                      ? Icons.person
                      : Icons.archive,
                  size: 40),
                  color: Colors.white,
                  onPressed: () {},
                ),*/
              ),
            ),
          ):SizedBox()

        ],
      ),
    );
  }

  Widget _buildNavItem(AssetImage icon, String label, int index) {
    return GestureDetector(
      onTap:()=>controller.changePage(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            icon,
            size: 50,
            color: selectedIndex == index ? Colors.blue : Color.fromRGBO(
                12, 62, 117, 1),
          ),
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
