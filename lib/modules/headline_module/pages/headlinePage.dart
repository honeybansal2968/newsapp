import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/modules/headline_module/controller/home_controller.dart';
import 'package:newsapp/modules/headline_module/pages/components/headlineCard.dart';
import 'package:newsapp/modules/home_module/pages/components/searchbar.dart';
import 'package:newsapp/ui_utils/appDrawer.dart';
import 'package:newsapp/ui_utils/app_text.dart';

class HeadlinePage extends StatelessWidget {
  const HeadlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: AppText.appText(text: "Top Headlines"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const SearchBarPage());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: GetBuilder<HeadlineController>(builder: (headlineController) {
          return headlineController.isHeadlinesloaded == false
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              headlineController.headlineModel.articles!.length,
                          itemBuilder: (context, index) {
                            return HeadlineCard(
                              articles: headlineController
                                  .headlineModel.articles![index],
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
