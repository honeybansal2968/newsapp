import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newsapp/models/newsModel.dart';
import 'package:newsapp/modules/news_module/pages/newsPage.dart';
import 'package:newsapp/ui_utils/app_text.dart';

class NewsCard extends StatelessWidget {
  Articles articles;
  NewsCard({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => NewsPage(articles: articles));
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 238, 238, 238)),
            child: Row(
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
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
                    )),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.appText(
                          text: articles.title,
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold)),
                      AppText.appText(text: articles.source!.name),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

bool isImageUrl(String url) {
  final lowerCaseUrl = url.toLowerCase();
  return lowerCaseUrl.endsWith('.jpg') || lowerCaseUrl.endsWith('.png');
}

Future<String?> getImgUrl(String url) async {
  try {
    (await NetworkAssetBundle(Uri.parse(url)).load(url)).buffer.asUint8List();
    return url;
  } catch (e) {
    return null;
  }
}
