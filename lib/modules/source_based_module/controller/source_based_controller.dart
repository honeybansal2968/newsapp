import 'package:get/get.dart';
import 'package:newsapp/models/headlineModel.dart';
import 'package:newsapp/models/newsModel.dart' as news;
import 'package:newsapp/modules/savedSources_module/helper/source_helper.dart';

class SourceBasedController extends GetxController {
  String source;
  SourceBasedController({required this.source});
  List<news.Articles> newsarticles = [];
  updateNewsarticles() async {
    newsarticles = await SourceHelper.filteredNews(source);
    update();
  }

  List<Articles> headlineArticles = [];
  updateHeadlineArticles() async {
    headlineArticles = await SourceHelper.filteredHeadlines(source);

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateNewsarticles();
    updateHeadlineArticles();
  }
}
