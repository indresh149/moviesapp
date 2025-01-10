import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';
import 'search_screen.dart';

class MainScreen extends StatelessWidget {
  final RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: currentIndex.value,
            children: [
              const HomeScreen(),
              SearchScreen(),
            ],
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: currentIndex.value,
            onTap: (index) => currentIndex.value = index,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            ],
          )),
    );
  }
}
