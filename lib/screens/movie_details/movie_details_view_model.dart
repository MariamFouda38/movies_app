import 'package:flutter/material.dart';
import 'package:movies_app/api/serveces/serveces.dart';

class MovieDetailsViewModel extends ChangeNotifier {
  final ApiServeces _movieService = ApiServeces();

  late Future<Map<String, dynamic>> movieDetailsFuture;
  late Future<List<dynamic>> categoriesFuture;
  late Future<List<dynamic>> similarMoviesFuture;
  late Future<String?> trailerVideoKeyFuture;

  MovieDetailsViewModel(int movieId) {
    movieDetailsFuture = _movieService.fetchMovieDetails(movieId);
    categoriesFuture = _movieService.fetchCategories();
    similarMoviesFuture = _movieService.fetchSimilarMovies(movieId);
    trailerVideoKeyFuture = _movieService.fetchTrailerVideoKey(movieId);
  }

  String getGenreName(List<dynamic>? genres, List<dynamic> categories) {
    if (genres == null || genres.isEmpty) return "Unknown";

    final categoryMap = {
      for (var category in categories)
        category['id']: category['name']
    };

    return genres.map((genre) {
      final genreId = genre['id'];
      return categoryMap[genreId] ?? "Unknown";
    }).join(', ');
  }
}