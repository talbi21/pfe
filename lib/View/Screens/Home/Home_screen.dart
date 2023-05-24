import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/BottomNavigationController.dart';

import '../../../Controllers/HomeController.dart';
import '../../shared_components/ApiError.dart';
import '../../shared_components/loading_overlay.dart';
import 'components/ArchiveitemHome.dart';
import 'components/Categoryitem.dart';
import 'components/Skeleton.dart';
import 'components/SummaryItem.dart';
import '../../shared_components/appBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Navigationcontroller = Get.put(BottomNavigationController());
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(),
          GetBuilder<HomeController>(builder: (controller) {
            if (controller.isLoading.value) {
              return HomeSkeleton();

            } else if (controller.hasError.value) {
              return ApiErrorWidget(
                message: 'Error occurred while loading data.',
                retryCallback: controller.fetchItems,
              );
            } else {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Browse by category",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Obx(() {
                            return categoryitem(
                              onSubmit: controller.ToIssues,
                              Title: 'Issues',
                              PrimaryColor: Color.fromRGBO(53, 97, 254, 1),
                              nbr: controller.nbrIssues.value,
                              secColor: Colors.white,
                            );
                          }),
                          Obx(() {
                            return categoryitem(
                              onSubmit: controller.ToFeatures,
                              Title: 'Features',
                              PrimaryColor: Color.fromRGBO(233, 234, 238, 1),
                              nbr: controller.nbrFeature.value,
                              secColor: Colors.black,
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Archive",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                        GestureDetector(
                          onTap: () => Navigationcontroller.changePage(0),
                          child: Row(
                            children: [
                              Text("See all",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                  )),
                              Icon(Icons.arrow_forward_ios_sharp)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.archiveTasks.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(() => Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: ArchiveItemHome(
                                    item: controller.archiveTasks.value[index],
                                    onDelete: () =>
                                        controller.deleteArchiveItem(controller
                                            .archiveTasks.value[index].id)),
                              ));
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Task Summary",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                        GestureDetector(
                          onTap: () => Navigationcontroller.changePage(3),
                          child: Row(
                            children: [
                              Text("See all",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                  )),
                              Icon(Icons.arrow_forward_ios_sharp)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 6.5,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() {
                              return SumItem(
                                  Status: "To Do",
                                  nbr: controller.nbrTodo.value,
                                  img: "assets/toDo.png",
                                  PrimaryColor: Color.fromRGBO(253, 159, 61, 1),
                                  onSubmit: () => controller.ToTodo());
                            }),
                            Obx(() {
                              return SumItem(
                                Status: "InProgress",
                                nbr: controller.nbrInProgress.value,
                                img: "assets/InProgress.png",
                                PrimaryColor: Color.fromRGBO(34, 94, 251, 1),
                                onSubmit: () => controller.ToInProgress(),
                              );
                            }),
                            Obx(() {
                              return SumItem(
                                Status: "Done",
                                nbr: controller.nbrDone.value,
                                img: "assets/Done.png",
                                PrimaryColor: Color.fromRGBO(44, 203, 215, 1),
                                onSubmit: () => controller.ToDone(),
                              );
                            }),
                          ],
                        )),
                  ),
                ],
              );
            }
          })
        ],
      ),
    );
  }
}

Widget _buildAppBar() {
  final Navigationcontroller = Get.put(BottomNavigationController());
  final controller = Get.put(HomeController());
  return Stack(
    children: [
      Appbar(TitleOn: false),
      Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                GestureDetector(
                  onTap: () => Navigationcontroller.changePage(2),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      radius: 50,
                      child: Image.asset(
                        'assets/user.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('Hi there',
                        style: TextStyle(
                          color: Color.fromRGBO(231, 231, 231, 0.5),
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                        )),
                    Text(controller.name.value,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                        ))
                  ],
                ),

            GestureDetector(
              onTap: controller.LogOut,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Icon(
                  Icons.logout_sharp,
                  size: 35,
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
