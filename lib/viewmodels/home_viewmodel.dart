import 'package:get/get.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class HomeViewModel extends GetxController {
  final ApiService _apiService = ApiService();
  final RxList<Movie> movies = <Movie>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllMovies();
  }

  Future<void> fetchAllMovies() async {
    try {
      isLoading.value = true;
      movies.value = await _apiService.getAllMovies();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load movies');
    } finally {
      isLoading.value = false;
    }
  }
}