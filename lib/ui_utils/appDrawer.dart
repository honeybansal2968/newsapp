import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/modules/home_module/pages/homePage.dart';
import 'package:newsapp/modules/savedSources_module/pages/sources_page.dart';

class AppDrawer extends StatelessWidget {
  final List<String> sections = [
    'Saved Sources',
  ];

  List<IconData> iconList = const [
    Icons.source,
  ];

  AppDrawer({super.key});

  void navigateTo(int index, context) {
    switch (index) {
      case 0:
        // Navigate logic for Home Screen

        Navigator.pop(context);
        Get.to(const SourcesPage());
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      width: 270,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: sections.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        navigateTo(index, context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(children: [
                          Icon(
                            iconList[index],
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            sections[index],
                            style: const TextStyle(color: Colors.black),
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
