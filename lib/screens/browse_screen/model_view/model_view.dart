import 'package:flutter/cupertino.dart';
import 'package:movies_app/api/serveces/serveces.dart';

class ViewModel extends ChangeNotifier {
  final ApiServeces _movieService = ApiServeces();
  List<dynamic> categories = [];
  bool isLoading = true;
  String? errorMessage;

  BrowseTabViewModel() {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      categories = await _movieService.fetchCategories();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}