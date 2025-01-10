import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';

class ApiService {
  static const String baseUrl = 'https://api.tvmaze.com';

  Future<List<Movie>> getAllMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/search/shows?q=all'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Movie.fromJson(json)).toList();
    }
    throw Exception('Failed to load movies');
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/search/shows?q=$query'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Movie.fromJson(json)).toList();
    }
    throw Exception('Failed to search movies');
  }
}