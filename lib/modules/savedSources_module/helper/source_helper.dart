import 'package:get/get.dart';
import 'package:newsapp/models/headlineModel.dart';
import 'package:newsapp/models/newsModel.dart' as news;
import 'package:newsapp/modules/headline_module/controller/home_controller.dart';
import 'package:newsapp/modules/home_module/controller/home_controller.dart';

class SourceHelper {
  // method to filter news based on source
  static Future<List<news.Articles>> filteredNews(String source) async {
    List<news.Articles> filteredNewsArticles = Get.find<HomeController>()
        .newsModel
        .articles!
        .where((element) => element.source!.name == source)
        .toList();
    print(filteredNewsArticles.length);
    return filteredNewsArticles;
  }

  static Future<List<Articles>> filteredHeadlines(String source) async {
    List<Articles> filteredHeadlineArticles = Get.find<HeadlineController>()
        .headlineModel
        .articles!
        .where((element) => element.source!.name == source)
        .toList();

    return filteredHeadlineArticles;
  }
}
