import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors_manager.dart';
import '../view_ model/movie_list_view_model.dart';
import '../widgets/widget.dart';

class MoviesListView extends StatelessWidget {
  final Map<String, dynamic> category;

  const MoviesListView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MoviesListViewModel(category['id']),
      child: Scaffold(
        backgroundColor: ColorsManager.background,
        appBar: AppBar(
          title: Text('${category['name']} Movies'),
        ),
        body: Consumer<MoviesListViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (viewModel.errorMessage != null) {
              return Center(child: Text('Error: ${viewModel.errorMessage}'));
            }
            if (viewModel.movies.isEmpty) {
              return const Center(child: Text('No movies available.'));
            }

            final movies = viewModel.movies;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Movie(movie: movie);
              },
            );
          },
        ),
      ),
    );
  }
}