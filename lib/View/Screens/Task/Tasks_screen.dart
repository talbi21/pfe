import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/View/Screens/Task/components/OptionList.dart';
import '../../../Controllers/TaskController.dart';
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
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: _buildOptions(context),
          ),

          _buildTaskList(context)
          // Taskitem(controller: controller, onSubmit: controller.ShowDetail),
        ],
      ),
    );
  }
}

Widget _buildOptions(BuildContext context) {
  final TaskController controller = Get.put(TaskController());

  return Container(

    width: MediaQuery.of(context).size.width,
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
  );
}

Widget _buildTaskList(BuildContext context) {
  final TaskController controller = Get.put(TaskController());
  return Container(
    height: MediaQuery.of(context).size.height - 200,
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Center(
        child: Obx(
          () => ListView.builder(
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
