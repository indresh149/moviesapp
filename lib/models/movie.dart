class Movie {
  final int id;
  final String name;
  final String summary;
  final String? imageUrl;
  final String? genres;
  final double? rating;

  Movie({
    required this.id,
    required this.name,
    required this.summary,
    this.imageUrl,
    this.genres,
    this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    final show = json['show'];
    return Movie(
      id: show['id'],
      name: show['name'],
      summary: _sanitizeSummary(show['summary'] ?? 'No summary available'),
      imageUrl: show['image']?['medium'],
      genres: show['genres']?.join(', '),
      rating: show['rating']?['average']?.toDouble(),
    );
  }

  static String _sanitizeSummary(String summary) {
    String cleanText = summary.replaceAll(RegExp(r'<[^>]*>'), '');

    cleanText = cleanText
        .replaceAll('\u003C', '<')
        .replaceAll('\u003E', '>')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&apos;', "'")
        .replaceAll('&amp;', '&');

    cleanText = cleanText.trim();

    return cleanText;
  }
}
