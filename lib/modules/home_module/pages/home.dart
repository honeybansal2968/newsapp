import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/modules/bookmark_module/controller/bookmark_controller.dart';
import 'package:newsapp/modules/headline_module/controller/home_controller.dart';
import 'package:newsapp/modules/home_module/controller/home_controller.dart';
import 'package:newsapp/modules/home_module/controller/navigation_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(BookMarkController());
    Get.put(HeadlineController());
    return GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (navigationController) {
          return Scaffold(
              body: GetBuilder<NavigationController>(
                init: NavigationController(),
                builder: (controller) {
                  return controller.currentPage;
                },
              ),
              bottomSheet: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 6.0,
                  child: Container(
                    height: 55,
                    color: Colors.white,
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NavButton(
                              index: 0,
                              buttonText: 'Home',
                              buttonIcon: CupertinoIcons.news),
                          NavButton(
                              index: 1,
                              buttonText: 'Headlines',
                              buttonIcon: Icons.tv),
                          NavButton(
                              index: 2,
                              buttonText: 'Bookmark',
                              buttonIcon: Icons.bookmark),
                        ]),
                  )));
        });
  }
}

class NavButton extends StatelessWidget {
  int index;
  String buttonText;
  IconData buttonIcon;
  NavButton(
      {super.key,
      required this.index,
      required this.buttonText,
      required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (controller) {
      return InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          controller.changePage(index);
        },
        child: Container(
          width: 55,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                buttonIcon,
                color: controller.currentIndex == index
                    ? Colors.black
                    : Colors.grey,
              ),
              Text(
                buttonText,
                style: TextStyle(
                  fontSize: 12,
                  color: controller.currentIndex == index
                      ? Colors.black
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
