import 'dart:convert';
import 'package:http/http.dart'as http;

const apiKey ='a87689669a0ae3386a00b1b420e4499c';

class ApiServeces {
  // final nowShowingApi ='https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
  // final newReleasesApi ='https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
  // final RecomendedApi='https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
  // final SearchApi ='https://api.themoviedb.org/3/search/movie?api_key=$apiKey';
  //
  // final BrowseListApi ='https://api.themoviedb.org/3/genre/movie/list ?api_key=$apiKey';
  // final BrowseDiscoverApi ='"https://api.themoviedb.org/3/discover/movie?api_key=$apiKey"';

  Future<List<dynamic>> fetchMovies(String endpoint) async {
    final url = "https://api.themoviedb.org/3$endpoint?api_key=$apiKey&language=en-US&page=1";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception("Failed to load movies");
    }
  }

  Future<List<dynamic>> fetchPopularMovies() {
    return fetchMovies("/movie/popular");
  }

  Future<List<dynamic>> fetchUpcomingMovies() {
    return fetchMovies("/movie/upcoming");
  }

  Future<List<dynamic>> fetchTopRatedMovies() {
    return fetchMovies("/movie/top_rated");
  }

  Future<List<dynamic>> fetchCategories() async {
    final url = "https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['genres'] as List<dynamic>; // Ensure you return the 'genres' list
    } else {
      throw Exception("Failed to load categories");
    }
  }

  Future<List<dynamic>> fetchMoviesByCategoryId(int genreId) async {
    final url = "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=$genreId&language=en-US&page=1";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception("Failed to load movies by category");
    }
  }
  Future<Map<String, dynamic>> fetchMovieDetails(int movieId) async {
    final url = "https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=en-US";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load movie details");
    }
  }

  Future<List<dynamic>> fetchSimilarMovies(int movieId) async {
    final url = "https://api.themoviedb.org/3/movie/$movieId/similar?api_key=$apiKey&language=en-US&page=1";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception("Failed to load similar movies");
    }
  }

  Future<String?> fetchTrailerVideoKey(int movieId) async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final results = json.decode(response.body)['results'] as List<dynamic>;
      if (results.isNotEmpty) {
        final trailer = results.firstWhere(
              (video) => video['type'] == 'Trailer' && video['site'] == 'YouTube',
          orElse: () => null,
        );
        return trailer?['key'];
      }
    } else {
      throw Exception('Failed to load trailer videos');
    }
    return null;
  }

}

  // Future<List<Movie>> getNowShowing()async{
  //   Uri url= Uri.parse(nowShowingApi);
  //   final response =await http.get(url);
  //     if (response.statusCode ==200){
  //       final List<dynamic> data = json.decode(response.body)['results'];
  //       List <Movie> movies =data.map((movie)=>Movie.fromMap(movie)).toList();
  //       return movies;
  //     }else {
  //       throw Exception('Failed to load data');
  //     }
  //
  // }
  // Future<List<Movie>> getnewReleases()async{
  //   Uri url= Uri.parse(newReleasesApi);
  //   final response =await http.get(url);
  //   if (response.statusCode ==200){
  //     final List<dynamic> data = json.decode(response.body)['results'];
  //     List <Movie> movies =data.map((movie)=>Movie.fromMap(movie)).toList();
  //     return movies;
  //   }else {
  //     throw Exception('Failed to load data');
  //   }
  //
  // }
  // Future<List<Movie>> getRecomended()async{
  //   Uri url= Uri.parse(RecomendedApi);
  //   final response =await http.get(url);
  //   if (response.statusCode ==200){
  //     final List<dynamic> data = json.decode(response.body)['results'];
  //     List <Movie> movies =data.map((movie)=>Movie.fromMap(movie)).toList();
  //     return movies;
  //   }else {
  //     throw Exception('Failed to load data');
  //   }
  //
  // }
  // Future<List<Movie>> getSearch()async{
  //   Uri url= Uri.parse(SearchApi);
  //   final response =await http.get(url);
  //   if (response.statusCode ==200){
  //     final List<dynamic> data = json.decode(response.body)['results'];
  //     List <Movie> movies =data.map((movie)=>Movie.fromMap(movie)).toList();
  //     return movies;
  //   }else {
  //     throw Exception('Failed to load data');
  //   }
  //
  // }
  // Future<List<Movie>> getBrowseList()async{
  //   Uri url= Uri.parse(BrowseListApi);
  //   final response =await http.get(url);
  //   if (response.statusCode ==200){
  //     final List<dynamic> data = json.decode(response.body)['results'];
  //     List <Movie> movies =data.map((movie)=>Movie.fromMap(movie)).toList();
  //     return movies;
  //   }else {
  //     throw Exception('Failed to load data');
  //   }
  //
  // }
  // Future<List<dynamic>> getBrowseDiscover() async {
  //   Uri url= Uri.parse(BrowseDiscoverApi);
  //   final response =await http.get(url);
  //
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body)['results'];
  //   } else {
  //     throw Exception("Failed to load movies by category");
  //   }
  // }


