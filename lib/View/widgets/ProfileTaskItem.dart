import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Archiveitem.dart';

class ProfileTaskitem extends StatelessWidget {
  final String Title;
  final RxString nbr;
  final Color colorr;




  const ProfileTaskitem({
    Key? key,
    required this.nbr,
    required this.Title, required this.colorr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color.fromRGBO(241, 241, 241, 1),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                blurStyle: BlurStyle.solid,
                offset: Offset(0, 4)
            ),
          ],
        ),
        height: 140,
        width: 130,
        child: Center(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nbr.toString(),
            style: TextStyle(
              fontSize: 50,
              color: colorr,

            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(Title,
              style: TextStyle(
                color: Color.fromRGBO(159, 173, 187, 1)
              ),
            )
          ],
        )),

      ),
    );
  }
}

