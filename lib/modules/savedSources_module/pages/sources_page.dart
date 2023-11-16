import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/modules/savedSources_module/controller/saved_sources_controller.dart';
import 'package:newsapp/modules/source_based_module/pages/source_based_page.dart';
import 'package:newsapp/ui_utils/app_text.dart';

class SourcesPage extends StatelessWidget {
  const SourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        elevation: 0,
        title: AppText.appText(
            text: "Saved Sources",
            textStyle: const TextStyle(color: Colors.black)),
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
      body:
          GetBuilder<SavedSourcesController>(builder: (savedSourcesController) {
        return SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                savedSourcesController.savedSources.isEmpty
                    ? const Center(child: Text("No Sources found"))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: savedSourcesController.savedSources.length,
                        itemBuilder: ((context, index) {
                          return SourceCard(
                              source:
                                  savedSourcesController.savedSources[index]);
                        })),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ));
      }),
    );
  }
}

class SourceCard extends StatelessWidget {
  String source;
  SourceCard({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.to(() => SourceBasedPage(source:source,));
          },
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 229, 229, 229),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(source)),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
