import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/PopupController.dart';
import '../../../Controllers/TaskController.dart';
import 'components/Category_Icon.dart';
import 'components/Skeleton.dart';
import 'components/task_item.dart';
import '../../shared_components/app_bar.dart';

class TaskPage extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());
  final popupController = Get.put(PopupController());

   TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Appbar(titleOn: true),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.status.length - 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () => controller.updateSelectedStatus(index),
                    child: Obx(() {
                      final isSelected = index == controller
                          .selectedStatusIndex.value;
                      return category_Icon(
                          PrimaryColor: isSelected ? Colors.white :
                          controller
                              .status[index] == "To do"
                              ? const Color.fromRGBO(17, 154, 253, 1)
                              : controller.status[index] == "In Progress"
                              ? const Color.fromRGBO(107, 119, 232, 1)
                              : const Color.fromRGBO(56, 232, 148, 1),
                          Title: controller.status[index],
                          width: 110,
                          height: 30,
                          icon: controller.status[index] == "To do"
                              ? 'assets/to-do-list.png'
                              : controller.status[index] == "In Progress"
                              ? 'assets/settings.png'
                              : 'assets/verify.png',
                          secColor: isSelected ? const Color.fromRGBO(
                              185, 204, 225, 0.25) : Colors.white);
                    }),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.types.length - 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () => controller.updateSelectedType(index),
                    child: Obx(() {
                      final isSelected = index == controller
                          .selectedTypeIndex.value;
                      return category_Icon(
                          PrimaryColor: isSelected ? Colors.white :

                          controller
                              .types[index] == "Issue"
                              ? const Color.fromRGBO(51, 185, 239, 1)
                              : const Color.fromRGBO(151, 159, 239, 1),

                          Title: controller.types[index],
                          width: 110,
                          height: 30,
                          icon: controller.types[index] == "Issue"
                              ? 'assets/maintenance.png'
                              : 'assets/feature.png',
                          secColor: isSelected ? const Color.fromRGBO(
                              185, 204, 225, 0.25) : Colors.white);
                    }),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),

          GetBuilder<TaskController>(builder: (controller) {
            if (controller.isLoading.value) {
              return const TaskSkeleton();
            } else {
              return Expanded(
                child: Obx(() {
                  final tasks = controller
                      .taskSelected(); // show tasks with selected category only

                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return
                        Obx(() {
                          return TaskItem(controller: controller,
                            onSubmit: () => controller.fixTask(task),
                            isHistoryVisible: controller
                                .isHistoryVisibleList[index].value,
                            showDetails: () =>
                                controller.toggleVisibility(index),
                            task: task,
                            isDetailsVisible: controller.isVisibleList[index]
                                .value,
                            showHistory: () =>
                                controller.toggleHistoryVisibility(index),);
                        });
                    },
                  );
                }),
              );
            }
          }
      ),
          const SizedBox(height: 70),


        ],
      ),
    );
  }
}




