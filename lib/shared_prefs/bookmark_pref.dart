import 'dart:convert';
import 'package:get/get.dart';
import 'package:newsapp/models/newsModel.dart';
import 'package:newsapp/modules/bookmark_module/controller/bookmark_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String keyArticles = 'articles';

  static Future<void> saveArticles(List<Articles> articles) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedArticles = jsonEncode(articles);
    prefs.setString(keyArticles, encodedArticles);
  }

  static Future<List<Articles>> getArticles() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedArticles = prefs.getString(keyArticles);
    if (encodedArticles != null) {
      final List<dynamic> decodedArticles = jsonDecode(encodedArticles);
      final List<Articles> articles =
          decodedArticles.map((e) => Articles.fromJson(e)).toList();
      print("articles ${articles.length}");
      return articles;
    }
    return [];
  }

  static Future<void> addArticle(Articles newArticle) async {
    List<Articles> articles = Get.find<BookMarkController>().bookmarkedArticles;

    await saveArticles(articles);
  }

  static Future<void> removeArticle(Articles articleToRemove) async {
    List<Articles> articles = Get.find<BookMarkController>().bookmarkedArticles;
    // Get.find<BookMarkController>().removeFromBookmarkArticles(articleToRemove);

    await saveArticles(articles);
  }
}
