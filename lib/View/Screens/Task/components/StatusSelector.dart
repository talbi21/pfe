import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/model/TaskModel.dart';

import '../../../../Controllers/TaskController.dart';
import 'Taskitem.dart';

class CategorySelector extends StatelessWidget {
  final TaskController controller ;

  CategorySelector(this.controller);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              for (int i = 0; i < controller.categories.length; i++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8,left: 8),
                    child:



                    TextButton(
                      onPressed: () {
                        controller.setSelectedIndex(i);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: controller.selectedIndex.value == i
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      child: Text(
                        controller.categories[i],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
