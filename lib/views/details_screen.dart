import 'package:flutter/material.dart';
import '../models/movie.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.imageUrl != null)
              Center(
                child: Image.network(
                  movie.imageUrl!,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              movie.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (movie.genres != null) ...[
              const SizedBox(height: 8),
              Text(
                'Genres: ${movie.genres}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
            if (movie.rating != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    '${movie.rating}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),
            Text(
              movie.summary,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
