import 'dart:convert';
import 'package:get/get.dart';
import 'package:newsapp/models/headlineModel.dart';
import 'package:newsapp/modules/headline_module/services/home_services.dart';

class HeadlineController extends GetxController {
  HeadlineModel headlineModel = HeadlineModel();
  bool isHeadlinesloaded = false;
  updateIsHeadlinesLoaded() {
    isHeadlinesloaded = !isHeadlinesloaded;
    update();
  }

  setHeadlineModel() async {
    String jsonResponse = await HeadlineServices.getheadlines();
    headlineModel = HeadlineModel.fromJson(jsonDecode(jsonResponse));
    update();
  }

  // search filters
  List<Articles> filteredArticles = [];
  void filterSearchResults(String query) {
    List<Articles> searchResults = [];
    if (query.isNotEmpty) {
      for (var item in headlineModel.articles!) {
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
    await setHeadlineModel();
    await updateIsHeadlinesLoaded();
  }
}
