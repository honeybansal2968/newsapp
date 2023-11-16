import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newsapp/models/headlineModel.dart' as headline;
import 'package:newsapp/models/newsModel.dart';
import 'package:newsapp/shared_prefs/bookmark_pref.dart';
import 'package:newsapp/shared_prefs/headline_shared_pref.dart';

class BookMarkController extends GetxController {
  BuildContext context;
  BookMarkController({required this.context});
  List<Articles> bookmarkedArticles = [];
  updateBookmarkArticles(articles) {
    bookmarkedArticles = articles;
    update();
  }

  addToBookmarkArticles(Articles articles) {
    bookmarkedArticles.add(articles);
    update();
  }

  // remove
  removeFromBookmarkArticles(Articles articles) {
    bookmarkedArticles.remove(articles);
    update();
  }

  List<headline.Articles> bookmarkedHeadlines = [];
  updateBookmarkedHeadlines(articles) {
    bookmarkedHeadlines = articles;
    update();
  }

  addToBookmarkedHeadlines(headline.Articles articles) {
    bookmarkedHeadlines.add(articles);
    update();
  }

  // remove
  removeFromBookmarkedHeadlines(headline.Articles articles) {
    bookmarkedHeadlines.remove(articles);
    update();
  }

  double containerPosition = 0;
  int buttonIndex = 0;
  updatebuttonIndex(int index) {
    buttonIndex = index;
  }

  updateContainerPosition(int buttonIndex, context) {
    containerPosition = buttonIndex == 0
        ? (MediaQuery.of(context).size.width - 350) / 2
        : (MediaQuery.of(context).size.width - 350) / 2 + 180;
    updatebuttonIndex(buttonIndex);
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    bookmarkedArticles = await SharedPreferencesHelper.getArticles();
    print(bookmarkedArticles.length);
    bookmarkedHeadlines = await HeadlineSharedPref.getArticles();
    containerPosition = (MediaQuery.of(context).size.width - 350) / 2;
  }
}
