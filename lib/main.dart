import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/views/search_screen.dart';
import 'viewmodels/home_viewmodel.dart';
import 'viewmodels/search_viewmodel.dart';
import 'views/main_screen.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(
          name: '/main',
          page: () => MainScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => HomeViewModel());
            Get.lazyPut(() => SearchViewModel());
          }),
        ),
        GetPage(
          name: '/search',
          page: () => SearchScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => HomeViewModel());
            Get.lazyPut(() => SearchViewModel());
          }),
        ),
      ],
    );
  }
}
