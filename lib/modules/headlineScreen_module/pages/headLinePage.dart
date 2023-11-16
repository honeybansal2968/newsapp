import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/modules/bookmark_module/controller/bookmark_controller.dart';
import 'package:newsapp/modules/home_module/pages/components/newsCard.dart';
import 'package:newsapp/modules/news_module/pages/newsPage.dart';
import 'package:newsapp/modules/savedSources_module/controller/saved_sources_controller.dart';
import 'package:newsapp/shared_prefs/headline_shared_pref.dart';
import 'package:newsapp/shared_prefs/sourcesSharedPref.dart';
import 'package:newsapp/ui_utils/app_text.dart';

import '../../../models/headlineModel.dart';

class HeadlineScreen extends StatelessWidget {
  Articles articles;
  HeadlineScreen({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder(
                        future: getImgUrl(articles.urlToImage.toString()),
                        builder: (BuildContext context,
                            AsyncSnapshot<String?> snapshot) {
                          bool error = snapshot.data == null;
                          return error
                              ? Container()
                              : Image.network(
                                  snapshot.data!,
                                );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    child: GetBuilder<BookMarkController>(
                        builder: (bookMarkController) {
                      return IconButton(
                          onPressed: () async {
                            checkifBookmarked(articles)
                                ? {
                                    bookMarkController
                                        .removeFromBookmarkedHeadlines(
                                            articles),
                                    await HeadlineSharedPref.removeArticle(
                                        articles)
                                  }
                                : {
                                    bookMarkController
                                        .addToBookmarkedHeadlines(articles),
                                    await HeadlineSharedPref.addArticle(
                                        articles)
                                  };
                          },
                          icon: Icon(
                            Icons.bookmark,
                            color: checkifBookmarked(articles)
                                ? const Color.fromARGB(255, 0, 4, 117)
                                : const Color.fromARGB(255, 176, 179, 255),
                            size: 28,
                          ));
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      launchSourceUrl(articles.url.toString());
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.link),
                        AppText.appText(text: "View Story")
                      ],
                    )),
                GetBuilder<SavedSourcesController>(
                    builder: (savedSourcesController) {
                  return ElevatedButton(
                      onPressed: () async {
                        checkifSourceSaved(articles.source!.name.toString())
                            ? {
                                savedSourcesController.removeSource(
                                    articles.source!.name.toString()),
                                await SourcesSharedPref.removeSource()
                              }
                            : {
                                savedSourcesController.addSource(
                                    articles.source!.name.toString()),
                                await SourcesSharedPref.addSource()
                              };
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Row(
                        children: [
                          checkifSourceSaved(articles.source!.name.toString())
                              ? const Icon(Icons.check)
                              : const Icon(Icons.add),
                          AppText.appText(text: "Save Source")
                        ],
                      ));
                })
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articles.title.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppText.appText(text: articles.source!.name.toString()),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  articles.description.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Author: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(articles.author.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }

  bool checkifBookmarked(articles) {
    return Get.find<BookMarkController>()
        .bookmarkedHeadlines
        .contains(articles);
  }

  bool checkifSourceSaved(String source) {
    return Get.find<SavedSourcesController>().savedSources.contains(source);
  }
}
