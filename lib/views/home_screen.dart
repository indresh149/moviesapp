import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/home_viewmodel.dart';
import '../viewmodels/search_viewmodel.dart';
import '../widgets/movie_card.dart';


class HomeScreen extends GetView<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        backgroundColor: const Color.fromARGB(255, 215, 52, 30),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.find<SearchViewModel>().clearSearch(); 
              Get.toNamed('/search');
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.movies.length,
          itemBuilder: (context, index) {
            final movie = controller.movies[index];
            return MovieCard(movie: movie);
          },
        );
      }),
    );
  }
}
