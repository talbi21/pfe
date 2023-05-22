import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/ArchiveController.dart';

import '../../shared_components/ApiError.dart';
import '../../shared_components/appBar.dart';
import 'components/ArchiveItem.dart';
import 'components/Skeleton.dart';

class Archive_screen extends StatelessWidget {

  //final ArchiveController controller = Get.put(ArchiveController());

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
 // final ArchiveController controller = Get.find<ArchiveController>();
  return GetBuilder<ArchiveController>(builder: (controller) {
    if (controller.isLoading.value) {

      return ShimmerList();
    } else if (controller.hasError.value) {
      return ApiErrorWidget(
        message: 'Error occurred while loading data.',
        retryCallback: controller.fetchItems,
      );
    } else {
      return Container(
        height: MediaQuery
            .of(context)
            .size
            .height - 150,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Center(
            child: Obx(
                  () =>
                  ListView.builder(
                    itemCount: controller.tasks.value.length,
                    itemBuilder: (context, index) {
                      final item = controller.tasks.value[index];

                      return ArchiveItem(item: item, onDelete: ()=>controller.DeleteItem(item.id), onDownload: ()=> controller.downloadAttachment(item.id, item.title),
                      );
                    },
                  ),
            ),
          ),
        ),
      );
    }
  });
}