import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/modules/home_module/pages/home.dart';
import 'package:newsapp/modules/noInternet_module/nointernet_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internet Connection Example',
      home: InternetConnectionChecker(),
    );
  }
}

class InternetConnectionChecker extends StatelessWidget {
  const InternetConnectionChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkInternetConnection(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            // User is connected to the internet, show the main app page
            return const Home();
          } else {
            // User is not connected to the internet, show the NoInternetPage
            return const NoInternetPage();
          }
        } else {
          // Loading indicator while checking the internet connection
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
