import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/ArchiveController.dart';

import '../../shared_components/appBar.dart';
import 'components/ArchiveItem.dart';

class Archive_screen extends StatelessWidget {
  // final controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appbar(TitleOn: true),
          _buildArchiveList(context)
        ],
      ),
    );
  }
}

Widget _buildArchiveList(BuildContext context) {
  final ArchiveContoller controller = Get.put(ArchiveContoller());
  return Container(
    height: MediaQuery.of(context).size.height - 150,
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Center(
        child: Obx(
              () => ListView.builder(
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              final item = controller.tasks[index];

              return ArchiveItem(item: item,
                  );
            },
          ),
        ),
      ),
    ),
  );
}