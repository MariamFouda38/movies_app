import 'package:flutter/material.dart';
import 'package:movies_app/api/serveces/serveces.dart';

class MoviesListViewModel extends ChangeNotifier {
  final ApiServeces _movieService = ApiServeces();
  List<dynamic> movies = [];
  bool isLoading = true;
  String? errorMessage;

  MoviesListViewModel(int categoryId) {
    fetchMoviesByCategoryId(categoryId);
  }

  Future<void> fetchMoviesByCategoryId(int categoryId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      movies = await _movieService.fetchMoviesByCategoryId(categoryId);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}