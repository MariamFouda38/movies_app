import 'package:flutter/material.dart';
import 'package:movies_app/core/app_styles.dart';

class Movie extends StatelessWidget {
  final Map<String, dynamic> movie;

  const Movie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: (){},
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                movie['poster_path'] != null
                    ? 'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
                    : 'https://via.placeholder.com/100',
                width: 150,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie['title'] ?? 'Unknown', style: AppStyles.headline),
                Text(movie['release_date'] ?? 'Unknown', style: AppStyles.headline),
              ],
            ),
          ],
        ),
      ),
    );
  }
}