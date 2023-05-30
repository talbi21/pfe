import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/archiveController.dart';

import '../../shared_components/api_error.dart';
import '../../shared_components/app_bar.dart';
import 'components/ArchiveItem.dart';
import 'components/Skeleton.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [const Appbar(titleOn: true), _buildArchiveList(context)],
      ),
    );
  }
}

Widget _buildArchiveList(BuildContext context) {
  return GetBuilder<ArchiveController>(builder: (controller) {
    if (controller.isLoading.value) {
      return const ShimmerList();
    } else if (controller.hasError.value) {
      return ApiErrorWidget(
        message: 'Error occurred while loading data.',
        retryCallback: controller.fetchItems,
      );
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height - 150,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Center(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.tasks.value.length,
                itemBuilder: (context, index) {
                  final item = controller.tasks.value[index];

                  return ArchiveItem(
                    item: item,
                    onDelete: () => controller.deleteItem(item.id),
                    onDownload: () =>
                        controller.downloadAttachment(item.id, "item.title"),
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
