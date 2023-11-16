import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/modules/bookmark_module/controller/bookmark_controller.dart';
import 'package:newsapp/modules/bookmark_module/pages/components/toggleBookmark.dart';
import 'package:newsapp/modules/headline_module/pages/components/headlineCard.dart';
import 'package:newsapp/modules/home_module/pages/components/newsCard.dart';
import 'package:newsapp/ui_utils/app_text.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText.appText(
            text: "Bookmarks", textStyle: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: GetBuilder<BookMarkController>(builder: (bookMarkController) {
        return SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const ToggleServices(),
              const SizedBox(
                height: 20,
              ),
              bookMarkController.buttonIndex == 0
                  ? bookMarkController.bookmarkedArticles.isEmpty
                      ? const Center(child: Text("No Bookmarks found"))
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              bookMarkController.bookmarkedArticles.length,
                          itemBuilder: ((context, index) {
                            return NewsCard(
                                articles: bookMarkController
                                    .bookmarkedArticles[index]);
                          }))
                  : bookMarkController.bookmarkedHeadlines.isEmpty
                      ? const Center(child: Text("No Bookmarks found"))
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              bookMarkController.bookmarkedHeadlines.length,
                          itemBuilder: ((context, index) {
                            return HeadlineCard(
                                articles: bookMarkController
                                    .bookmarkedHeadlines[index]);
                          })),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ));
      }),
    );
  }
}

class ServiceButtons extends StatelessWidget {
  String service;
  Color? serviceColor;
  ServiceButtons({super.key, required this.service, this.serviceColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
            child: Center(
              child: Text(
                service,
                style: TextStyle(
                    color: serviceColor ?? Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
