import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/modules/home_module/controller/home_controller.dart';
import 'package:newsapp/modules/news_module/pages/newsPage.dart';

class SearchBarPage extends StatelessWidget {
  const SearchBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<HomeController>().filteredArticles.clear();
        return true;
      },
      child: Scaffold(
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
              Get.find<HomeController>().filteredArticles.clear();
            },
          ),
        ),
        body: GetBuilder<HomeController>(builder: (homeController) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    homeController.filterSearchResults(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: homeController.filteredArticles.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Get.to(() => NewsPage(
                                    articles:
                                        homeController.filteredArticles[index],
                                  ));
                            },
                            tileColor: const Color.fromARGB(255, 244, 244, 244),
                            title: Text(homeController
                                .filteredArticles[index].title
                                .toString()),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
