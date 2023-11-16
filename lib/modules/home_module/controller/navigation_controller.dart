import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/modules/bookmark_module/pages/bookmarkPage.dart';
import 'package:newsapp/modules/headline_module/pages/headlinePage.dart';
import 'package:newsapp/modules/home_module/pages/homePage.dart';

class NavigationController extends GetxController {
  int currentIndex = 0;

  NavigationController() {
    _initPages(); // Call the function to initialize pages list
  }

  final List<Widget> pages = [];

  void _initPages() {
    pages.addAll([
      const HomePage(),
      const HeadlinePage(),
      const BookmarkPage(),
    ]);
  }
  
  Widget get currentPage => pages[currentIndex];

  void changePage(int index) {
    currentIndex = index;
    update();
  }
}