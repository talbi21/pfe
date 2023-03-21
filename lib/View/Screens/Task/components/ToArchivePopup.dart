import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controllers/PopupController.dart';
import '../../dashboard.dart';

class ArchivePopup extends StatelessWidget {
  const ArchivePopup({super.key});


  Widget build(BuildContext context) {
    final controller = Get.put(PopupController());
    return AlertDialog(
      title:
      Align(
        alignment: Alignment.center,
        child: Text("Thank \n you !"),
      ),

      content: Text("Do you want to move this task to archive?"),
      actions: <Widget>[
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(80, 20),
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(56, 232, 148, 0.5),
                  // text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // rounded corners
                  ),
                ),
                onPressed: () => controller.closeArchivePopup(),
                child: Text("Oui"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(80, 20),
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(255, 0, 0, 0.5), // text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // rounded corners
                  ),
                ),
                onPressed: () => Get.back(),
                child: Text("Non"),
              )
            ],
          ),
        )

      ],
    );
  }
}