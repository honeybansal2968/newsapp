import 'dart:convert';
import 'package:get/get.dart';
import 'package:newsapp/models/newsModel.dart';
import 'package:newsapp/modules/home_module/services/home_services.dart';

class HomeController extends GetxController {
  NewsModel newsModel = NewsModel();
  bool isNewsloaded = false;
  updateIsNewsLoaded() {
    isNewsloaded = !isNewsloaded;
    update();
  }

  setNewsModel() async {
    String jsonResponse = await HomeServices.getNews();
    newsModel = NewsModel.fromJson(jsonDecode(jsonResponse));
    update();
  }

  // search filters
  List<Articles> filteredArticles = [];
  void filterSearchResults(String query) {
    List<Articles> searchResults = [];
    if (query.isNotEmpty) {
      for (var item in newsModel.articles!) {
        if (item.title!.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      }
    } else {
      searchResults = [];
    }

    filteredArticles = searchResults;
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await setNewsModel();
    await updateIsNewsLoaded();
  }
}
