import 'dart:convert';
import 'package:get/get.dart';
import 'package:newsapp/modules/savedSources_module/controller/saved_sources_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SourcesSharedPref {
  static const String keySources = 'saources';

  static Future<void> saveSources(List<String> sources) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedSources = jsonEncode(sources);
    prefs.setString(keySources, encodedSources);
  }

  static Future<List<String>> getSources() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedSources = prefs.getString(keySources);

    if (encodedSources != null) {
      final List<dynamic> decodedSources = jsonDecode(encodedSources);
      final List<String> sources =
          decodedSources.map((e) => e as String).toList();
      return sources;
    }

    return [];
  }

  static Future<void> addSource() async {
    List<String> sources = Get.find<SavedSourcesController>().savedSources;

    await saveSources(sources);
  }

  static Future<void> removeSource() async {
    List<String> sources = Get.find<SavedSourcesController>().savedSources;


    await saveSources(sources);
  }
}
