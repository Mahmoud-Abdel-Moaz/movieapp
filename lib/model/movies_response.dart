import 'movie.dart';

class MoviesResponse {
    int? page;
    List<Movie>? movies;
    int? totalPages;
    int? totalResults;

    MoviesResponse({this.page, this.movies, this.totalPages, this.totalResults});

    factory MoviesResponse.fromJson(Map<String, dynamic> json) {
        return MoviesResponse(
            page: json['page'], 
            movies: json['results'] != null ? (json['results'] as List).map((i) => Movie.fromJson(i)).toList() : null,
            totalPages: json['total_pages'],
            totalResults: json['total_results'],
        );
    }
}