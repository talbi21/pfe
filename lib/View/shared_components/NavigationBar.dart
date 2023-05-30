import 'package:flutter/material.dart';
import 'package:untitled2/Controllers/bottomNavigationController.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final BottomNavigationController controller;


  const CustomBottomNavigationBar(
      {Key? key,
      required this.selectedIndex,
      required this.controller,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.white],
          stops: [0.3, 0.2],
        ),
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
                _buildNavItem(
                    const AssetImage('assets/iconArchieve.png'),
                    selectedIndex == 1
                        ? 'Archive'
                        : selectedIndex == 2
                            ? 'Archive'
                        : selectedIndex == 3
                        ? 'Archive'
                            : '',
                    0),
                _buildNavItem(
                    const AssetImage('assets/iconHome.png'),
                    selectedIndex == 1
                        ? ''
                        : selectedIndex == 2
                            ? 'Home'
                            : 'Home',
                    1),
                _buildNavItem(
                    const AssetImage('assets/iconProfile.png'),
                    selectedIndex == 1
                        ? 'Profile'
                        : selectedIndex == 2
                            ? ''
                            : 'Profile',
                    2),
              ],
            ),
          ),
          selectedIndex != 3
              ? Positioned(
                  left: 40,
                  right: 40,
                  bottom: 25,
                  child: AnimatedAlign(
                    alignment: selectedIndex == 1
                        ? Alignment.center
                        : selectedIndex == 2
                            ? Alignment.bottomRight
                            : Alignment.bottomLeft,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(12, 62, 117, 1),
                        ),
                        child: Image.asset(
                          selectedIndex == 1
                              ? "assets/iconHome.png"
                              : selectedIndex == 2
                                  ? "assets/iconProfile.png"
                                  : "assets/iconArchieve.png",
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        )),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  Widget _buildNavItem(AssetImage icon, String label, int index) {
    return GestureDetector(
        onTap: () => controller.changePage(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ImageIcon(
              icon,
              size: 50,
              color: selectedIndex == index
                  ? Colors.blue
                  : const Color.fromRGBO(12, 62, 117, 1),
            ),
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index
                      ? Colors.blue
                      : const Color.fromRGBO(12, 62, 117, 1)),
            ),
          ],
        ));
  }
}
