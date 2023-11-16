import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/modules/home_module/controller/home_controller.dart';
import 'package:newsapp/modules/home_module/pages/components/newsCard.dart';
import 'package:newsapp/modules/home_module/pages/components/searchbar.dart';
import 'package:newsapp/ui_utils/appDrawer.dart';
import 'package:newsapp/ui_utils/app_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: AppText.appText(text: "Your Feeds"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const SearchBarPage());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: GetBuilder<HomeController>(builder: (homeController) {
          return homeController.isNewsloaded == false
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: homeController.newsModel.articles!.length,
                          itemBuilder: (context, index) {
                            return NewsCard(
                              articles:
                                  homeController.newsModel.articles![index],
                            );
                          }),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
