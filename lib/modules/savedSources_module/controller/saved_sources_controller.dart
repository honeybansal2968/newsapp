import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/shared_prefs/sourcesSharedPref.dart';

class SavedSourcesController extends GetxController {
  List<String> savedSources = [];
  void addSource(String source) {
    savedSources.add(source);
    update();
  }

  void removeSource(String source) {
    savedSources.remove(source);
    update();
  }

  updateSources(List<String> sources) {
    savedSources = sources;
    update();
  }
 
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    savedSources = await SourcesSharedPref.getSources();
    updateSources(savedSources);
  }
}
