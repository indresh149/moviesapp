import 'package:get/get.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class SearchViewModel extends GetxController {
  final ApiService _apiService = ApiService();
  final RxList<Movie> searchResults = <Movie>[].obs;
  final RxBool isLoading = false.obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    ever(searchQuery, (_) => searchMovies(searchQuery.value));
  }

  @override
  void onClose() {
    clearSearch();
    super.onClose();
  }

  void clearSearch() {
    searchQuery.value = '';
    searchResults.clear();
  }

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }

    try {
      isLoading.value = true;
      searchResults.value = await _apiService.searchMovies(query);
    } catch (e) {
      Get.snackbar('Error', 'Failed to search movies');
    } finally {
      isLoading.value = false;
    }
  }
}
