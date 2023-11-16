import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/api/apiEndpoints.dart';

class HeadlineServices {
  // method to call newsapi
  static Future getheadlines() async {
    try {
      http.Response response = await http.get(Uri.parse(headlineApi));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: Text(
          "Something went wrong",
        )));
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: Text(
        e.toString(),
      )));
    }
  }
}
