import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/modules/bookmark_module/controller/bookmark_controller.dart';
import 'package:newsapp/modules/bookmark_module/pages/components/toggleBookmark.dart';
import 'package:newsapp/modules/headline_module/pages/components/headlineCard.dart';
import 'package:newsapp/modules/home_module/pages/components/newsCard.dart';
import 'package:newsapp/modules/source_based_module/controller/source_based_controller.dart';

class SourceBasedPage extends StatelessWidget {
  String source;
  SourceBasedPage({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          source,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: GetBuilder<BookMarkController>(builder: (bookMarkController) {
        return SingleChildScrollView(
            child: GetBuilder<SourceBasedController>(
                init: SourceBasedController(source: source),
                builder: (sourceBasedController) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const ToggleServices(),
                      const SizedBox(
                        height: 20,
                      ),
                      bookMarkController.buttonIndex == 0
                          ? sourceBasedController.newsarticles.isEmpty
                              ? const Center(child: Text("No Source found"))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      sourceBasedController.newsarticles.length,
                                  itemBuilder: ((context, index) {
                                    return NewsCard(
                                        articles: sourceBasedController
                                            .newsarticles[index]);
                                  }))
                          : sourceBasedController.headlineArticles.isEmpty
                              ? const Center(child: Text("No Source found"))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: sourceBasedController
                                      .headlineArticles.length,
                                  itemBuilder: ((context, index) {
                                    return HeadlineCard(
                                        articles: sourceBasedController
                                            .headlineArticles[index]);
                                  })),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  );
                }));
      }),
    ));
  }
}
