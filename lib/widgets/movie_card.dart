import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/movie.dart';
import '../views/details_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () => Get.to(() => DetailsScreen(movie: movie)),
        child: Row(
          children: [
            if (movie.imageUrl != null)
              ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(4)),
                child: Image.network(
                  movie.imageUrl!,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.summary,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
