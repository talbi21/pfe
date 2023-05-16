import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/PopupController.dart';
import '../../../Controllers/TaskController.dart';
import 'components/Category_Icon.dart';
import 'components/Taskitem.dart';
import '../../shared_components/appBar.dart';

class TaskPage extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());
  final popupcontroller = Get.put(PopupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appbar(TitleOn: true),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.Status.length - 1,
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
                              .Status[index] == "To do"
                              ? Color.fromRGBO(17, 154, 253, 1)
                              : controller.Status[index] == "In Progress"
                              ? Color.fromRGBO(107, 119, 232, 1)
                              : Color.fromRGBO(56, 232, 148, 1),
                          Title: controller.Status[index],
                          width: 110,
                          height: 30,
                          icon: controller.Status[index] == "To do"
                              ? 'assets/to-do-list.png'
                              : controller.Status[index] == "In Progress"
                              ? 'assets/settings.png'
                              : 'assets/verify.png',
                          secColor: isSelected ? Color.fromRGBO(
                              185, 204, 225, 0.25) : Colors.white);
                    }),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.Types.length - 1,
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
                              .Types[index] == "Issue"
                              ? Color.fromRGBO(51, 185, 239, 1)
                              : Color.fromRGBO(151, 159, 239, 1),

                          Title: controller.Types[index],
                          width: 110,
                          height: 30,
                          icon: controller.Types[index] == "Issue"
                              ? 'assets/maintenance.png'
                              : 'assets/feature.png',
                          secColor: isSelected ? Color.fromRGBO(
                              185, 204, 225, 0.25) : Colors.white);
                    }),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),

          GetBuilder<TaskController>(builder: (controller) {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Expanded(
                child: Obx(() {
                  final tasks = controller
                      .TaskSelected(); // show tasks with selected category only

                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return
                        Obx(() {
                          return Taskitem(controller: controller,
                            onSubmit: () => controller.FixTask(task),
                            isHistoryVisible: controller
                                .isHistoryVisibleList[index].value,
                            ShowDetails: () =>
                                controller.toggleVisibility(index),
                            task: task,
                            isDetailsVisible: controller.isVisibleList[index]
                                .value,
                            ShowHistory: () =>
                                controller.toggleHistoryVisibility(index),);
                        });
                    },
                  );
                }),
              );
            }
          }
      ),
          SizedBox(height: 70),


        ],
      ),
    );
  }
}




