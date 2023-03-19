import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/View/Screens/Task/components/OptionList.dart';
import '../../../Controllers/TaskController.dart';
import '../../../model/TaskModel.dart';
import 'components/Category_Icon.dart';
import 'components/StatusSelector.dart';
import 'components/Taskitem.dart';
import '../../shared_components/appBar.dart';
import 'components/SelectableButton.dart';

class TaskPage extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appbar(TitleOn: true),
          // _buildOptions(context),
          //CategorySelector(controller),
          Container(
            height: 30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () => controller.updateSelectedCategory(index),
                    child: Obx(() {
                      final isSelected = index == controller.selectedCategoryIndex.value;
                      return category_Icon(PrimaryColor: controller
                          .categories[index] == "To do"
                          ? Color.fromRGBO(17, 154, 253, 1)
                          : controller.categories[index] == "In Progress"
                          ? Color.fromRGBO(107, 119, 232, 1)
                          : Color.fromRGBO(56, 232, 148, 1),
                        Title: controller.categories[index],
                        width: 110,
                        height: 30,
                        icon: controller.categories[index] == "To do"
                            ? 'assets/to-do-list.png'
                            : controller.categories[index] == "In Progress"
                            ? 'assets/settings.png'
                            : 'assets/verify.png',);
                    }),
                  ),
                );

              },
            ),
          ),
          SizedBox(height: 20),

          Expanded(
            child: Obx(() {
              final tasks =  controller.tasks
                  .where((task) =>
              task.status ==
                  controller.categories[controller.selectedCategoryIndex.value].toString())
                  .toList(); // show tasks with selected category only

              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return
                    Taskitem(controller: controller, onSubmit: () {  }, Title: task.title, Date: task.date, Description: task.description, status: task.status, type: task.type);

                  /*ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.description),
                    // ...
                  );*/
                },
              );
            }),
          ),
          SizedBox(height: 70)
          // _buildTaskList(context),

        ],
      ),
    );
  }
}

Widget _buildItemWidget(Task item) {
  return ListTile(
    title: Text(item.title),
  );
}

Widget _buildOptions(BuildContext context) {
  final TaskController controller = Get.put(TaskController());

  return Padding(
    padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    child: Container(

      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (BuildContext context, int index) {
          final item = options[index];
          return Obx(() {
            return SelectableButton(
              Title: item.title,
              isSelected: controller.selections.contains(item.title),
              onPressed: () {
                controller.toggleSelection(item.title);
              },
              PrimaryColor: item.color,
              width: 70,
              height: 10,
              icon: item.icon,
            );
          });
        },
      ),
    ),
  );
}

Widget _buildTaskList(BuildContext context) {
  final TaskController controller = Get.put(TaskController());
  return Container(
    height: MediaQuery
        .of(context)
        .size
        .height - 220,
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
                itemCount: controller.tasks.length,
                itemBuilder: (context, index) {
                  final item = controller.tasks[index];

                  return Taskitem(
                      controller: controller,
                      onSubmit: controller.ShowDetail,
                      Title: item.title,
                      Date: item.date,
                      Description: item.description,
                      status: item.status,
                      type: item.type);
                },
              ),
        ),
      ),
    ),
  );
}
