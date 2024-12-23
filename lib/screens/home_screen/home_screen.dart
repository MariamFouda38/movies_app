import 'package:flutter/material.dart';
import 'package:movies_app/api/serveces/serveces.dart';
import 'package:movies_app/screens/home_screen/widget/widget.dart';

import '../../core/colors_manager.dart';

class HomeTabView extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTabView> {
  final ApiServeces _movieService = ApiServeces();

  late Future<List<dynamic>> popularMoviesFuture;
  late Future<List<dynamic>> upcomingMoviesFuture;
  late Future<List<dynamic>> topRatedMoviesFuture;

  @override
  void initState() {
    super.initState();
    popularMoviesFuture = _movieService.fetchPopularMovies();
    upcomingMoviesFuture = _movieService.fetchUpcomingMovies();
    topRatedMoviesFuture = _movieService.fetchTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<dynamic>>(
              future: popularMoviesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  return buildCarousel(snapshot.data!);
                } else {
                  return const Center(child: Text("No movies available."));
                }
              },
            ),
            buildMovieList("New Releases", upcomingMoviesFuture),
            buildMovieList("Recommended", topRatedMoviesFuture),
          ],
        ),
      ),
    );
  }
}