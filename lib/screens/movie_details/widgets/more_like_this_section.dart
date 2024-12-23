import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_styles.dart';
import '../../../core/colors_manager.dart';
import '../../widgets/movie_image_with_add_button.dart';
import '../movie_details_view.dart';

class MoreLikeThisSection extends StatelessWidget {
  final Future<List<dynamic>> similarMoviesFuture;

  const MoreLikeThisSection({
    Key? key,
    required this.similarMoviesFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: similarMoviesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          final movies = snapshot.data!;
          if (movies.isEmpty) {
            return Padding(
              padding: REdgeInsets.all(8.0),
              child: const Text("No similar movies available."),
            );
          }
          return Padding(
            padding: REdgeInsets.all(0.0),
            child: Container(
              color: ColorsManager.darkGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: REdgeInsets.all(8.0),
                    child: Text(
                      "More Like This",
                      style: AppStyles.header,
                    ),
                  ),
                  SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        final movieId = movie['id'];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailsView(movieId: movieId),
                              ),
                            );
                          },
                          child: Padding(
                            padding: REdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              children: [
                                MovieImageWithAddButton(
                                  imageUrl: 'https://image.tmdb.org/t/p/w500${movie['poster_path'] ?? ''}',
                                  onAddPressed: () {
                                    // Add to watch list
                                  },
                                  imageWidth: 100.w,
                                  imageHeight: 150.h,
                                ),
                                SizedBox(height: 8.h),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(Icons.star, color: ColorsManager.selectedItem, size: 10.sp),
                                      Text(
                                        movie['vote_average'].toString(),
                                        style: AppStyles.headline,
                                      ),
                                    ],
                                  ),
                                ),SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    movie['title'] ?? 'Unknown',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style:AppStyles.headline,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        movie['release_date'],
                                        style: AppStyles.headline,
                                      ),
                                      Text(
                                        "1h 59m",
                                        style: AppStyles.headline,
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: REdgeInsets.all(8.0),
            child: Text("No similar movies available."),
          );
        }
      },
    );
  }
}