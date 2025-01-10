import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/search_viewmodel.dart';
import '../widgets/movie_card.dart';

class SearchScreen extends GetView<SearchViewModel> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    _searchController.text = controller.searchQuery.value;
    
    return WillPopScope(
      onWillPop: () async {
        controller.clearSearch();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Enter movie title',
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  controller.clearSearch();
                },
              ),
            ),
            onChanged: (query) => controller.searchQuery.value = query,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              controller.clearSearch();
              Get.back();
            },
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: controller.searchResults.length,
            itemBuilder: (context, index) {
              final movie = controller.searchResults[index];
              return MovieCard(movie: movie);
            },
          );
        }),
      ),
    );
  }
}