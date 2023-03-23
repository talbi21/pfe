import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/model/TaskModel.dart';

import '../../../../Controllers/PopupController.dart';
import '../../Login/components/Button.dart';
import 'Category_Icon.dart';

class FixPopUp extends StatelessWidget {
  final Task task;

  const FixPopUp({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PopupController());
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: () => Get.back(), icon: Icon(
                    Icons.clear
                ),

                ),
              ),
              Text(
                'Fix Task',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Task title',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(2, 34, 70, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(205, 205, 205, 1))),
                    hintText: task.title,
                    hintStyle: TextStyle(
                      color: Colors.black,
                    )),
                enabled: false,
              ),
              Divider(
                thickness: 1,
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Category',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(2, 34, 70, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  category_Icon(
                      secColor: Color.fromRGBO(185, 204, 225, 0.25),
                      PrimaryColor: Colors.white,
                      Title: task.type,
                      width: 60,
                      height: 25,
                      icon: task.type == "Issue"
                          ? 'assets/maintenance.png'
                          : 'assets/feature.png'),
                  SizedBox(width: 10),
                  category_Icon(
                    secColor: Color.fromRGBO(185, 204, 225, 0.25),
                    PrimaryColor: Colors.white,
                    Title: task.status,
                    width: 60,
                    height: 25,
                    icon: task.status == "To do"
                        ? 'assets/to-do-list.png'
                        : task.status == "In Progress"
                        ? 'assets/settings.png'
                        : 'assets/verify.png',
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Created on',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(2, 34, 70, 1),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Color.fromRGBO(250, 250, 250, 1),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 4,
                                blurStyle: BlurStyle.solid,
                                offset: Offset(0, 5)),
                          ],
                        ),
                        height: 35,
                        width: 120,
                        child: Center(
                          child: Text(
                            task.date,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Ends on',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(2, 34, 70, 1),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Color.fromRGBO(250, 250, 250, 1),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 4,
                                blurStyle: BlurStyle.solid,
                                offset: Offset(0, 5)),
                          ],
                        ),
                        height: 35,
                        width: 120,
                        child: Center(
                          child: Text(
                            "${DateTime
                                .now()
                                .day} ${DateTime
                                .now()
                                .month} ${DateTime
                                .now()
                                .year}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Contributors',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(2, 34, 70, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 5, left: 3, top: 2, bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage("assets/exempleuser.jpg"),
                            radius: 15,
                          ),
                          SizedBox(width: 7.5),
                          Text("Achref.T")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 5, left: 3, top: 2, bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage("assets/exempleuser.jpg"),
                            radius: 15,
                          ),
                          SizedBox(width: 7.5),
                          Text("Achref.T")
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 1,
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(2, 34, 70, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(
                    color: Colors.grey
                ),
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "tap here",
                  prefixIcon:
                  GestureDetector(
                    onTap: controller.pickFile,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 10),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: Colors.grey,
                        strokeWidth: 1,
                        dashPattern: [5, 5],
                        padding: EdgeInsets.all(8),
                        radius: Radius.circular(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() {
                              return Image.asset(controller.selectedFile.value != null ?
                                  "assets/attdone.png": "assets/Attachment.png",
                                  height: 30);
                            }),
                            Obx(() =>
                                Text(controller.selectedFile.value != null ?
                                "Downloaded": 'Attachment')),

                          ],
                          /*
                             children: [
          Obx(() => Text(attachmentController.selectedFile.value?.files.single?.name ?? 'No file selected')),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: attachmentController.pickFile,
            child: Text('Select File'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: attachmentController.clearSelection,
            child: Text('Clear Selection'),
          ),
        ],
                             */
                        ),
                      ),
                    ),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Color.fromRGBO(205, 205, 205, 1))),
                ),
              ),
              SizedBox(height: 10),

              SubmitButton(
                  onSubmit: () => controller.openArchivePopup(), text: 'Send')
            ],
          ),
        ),
      ),
    );
  }
}
