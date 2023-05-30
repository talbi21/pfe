import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controllers/bottomNavigationController.dart';
import '../../../Controllers/HomeController.dart';
import '../../../data/api_constants.dart';
import '../../shared_components/api_error.dart';
import 'components/ArchiveItemHome.dart';
import 'components/Categoryitem.dart';
import 'components/Skeleton.dart';
import 'components/SummaryItem.dart';
import '../../shared_components/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(BottomNavigationController());
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(),
          GetBuilder<HomeController>(builder: (controller) {
            if (controller.isLoading.value) {
              return const HomeSkeleton();
            } else if (controller.hasError.value) {
              return ApiErrorWidget(
                message: 'Error occurred while loading data.',
                retryCallback: controller.fetchItems,
              );
            } else {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
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
                    child: SizedBox(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Obx(() {
                            return CategoryItem(
                              onSubmit: controller.toIssues,
                              title: 'Issues',
                              primaryColor:
                                  const Color.fromRGBO(53, 97, 254, 1),
                              nbr: controller.nbrIssues.value,
                              secColor: Colors.white,
                            );
                          }),
                          Obx(() {
                            return CategoryItem(
                              onSubmit: controller.toFeatures,
                              title: 'Features',
                              primaryColor:
                                  const Color.fromRGBO(233, 234, 238, 1),
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
                        const Align(
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
                          onTap: () => navigationController.changePage(0),
                          child: Row(
                            children: [
                              Text("See all",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                  )),
                              const Icon(Icons.arrow_forward_ios_sharp)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SizedBox(
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
                        const Align(
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
                          onTap: () => navigationController.changePage(3),
                          child: Row(
                            children: [
                              Text("See all",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                  )),
                              const Icon(Icons.arrow_forward_ios_sharp)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height / 6.5,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() {
                              return SumItem(
                                  status: "To Do",
                                  nbr: controller.nbrTodo.value,
                                  img: "assets/toDo.png",
                                  primaryColor:
                                      const Color.fromRGBO(253, 159, 61, 1),
                                  onSubmit: () => controller.toTodo());
                            }),
                            Obx(() {
                              return SumItem(
                                status: "InProgress",
                                nbr: controller.nbrInProgress.value,
                                img: "assets/InProgress.png",
                                primaryColor:
                                    const Color.fromRGBO(34, 94, 251, 1),
                                onSubmit: () => controller.toInProgress(),
                              );
                            }),
                            Obx(() {
                              return SumItem(
                                status: "Done",
                                nbr: controller.nbrDone.value,
                                img: "assets/Done.png",
                                primaryColor:
                                    const Color.fromRGBO(44, 203, 215, 1),
                                onSubmit: () => controller.toDone(),
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
  final navigationController = Get.put(BottomNavigationController());
  final controller = Get.put(HomeController());
  return Stack(
    children: [
      const Appbar(titleOn: false),
      Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => navigationController.changePage(2),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                width: 60,
                height: 60,
                child: CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                      child: controller.image.value != ""
                          ? Image.network(
                              ApiConstants.baseUrl + controller.image.value,
                              fit: BoxFit.fill,
                              width: 100,
                              height: 100,
                            )
                          : Image.asset(
                              "assets/avatar.png",
                              fit: BoxFit.cover,
                            )),
                ),
              ),
            ),
            Column(
              children: [
                const Text('Hi there',
                    style: TextStyle(
                      color: Color.fromRGBO(231, 231, 231, 0.5),
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                    )),
                Text(controller.name.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                    ))
              ],
            ),
            GestureDetector(
              onTap: controller.logOut,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
                child: const Icon(
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
