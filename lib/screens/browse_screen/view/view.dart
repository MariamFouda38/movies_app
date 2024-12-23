
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_styles.dart';
import '../../../core/assets_manager.dart';
import '../../../core/colors_manager.dart';
import '../../movie_list/view/movie_list_view.dart';
import '../model_view/model_view.dart';

class BrowsetabView extends StatelessWidget {
  const BrowsetabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ViewModel(),
      child: Scaffold(
        backgroundColor: ColorsManager.background,
        appBar: AppBar(
          title: Text('Browse Categories',style: AppStyles.headline,),
        ),
        body: Consumer<ViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.errorMessage != null) {
              return Center(child: Text('Error: ${viewModel.errorMessage}'));
            }

            if (viewModel.categories.isEmpty) {
              return const Center(child: Text('No categories available.'));
            }

            final categories = viewModel.categories;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoviesListView(category: category),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            AssetsManager.moviePoster,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            category['name'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                );
              },
            );
          },
        ),
      ),
    );
  }
}