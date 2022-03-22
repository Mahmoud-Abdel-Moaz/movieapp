import 'package:flutter/foundation.dart';

import '../model/movie.dart';
import '../model/movie_details.dart';
import '../model/movies_response.dart';
import '../shared/components/constants.dart';
import '../shared/network/remote/dio_helper.dart';

class MovieProvider with ChangeNotifier {
  MoviesResponse? _moviesResponse;

  MoviesResponse? get moviesResponse => _moviesResponse;
  final List<Movie> _movies = [];

  List<Movie> get movies => _movies;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  int _page = 1;

  MovieDetails? _movieDetails;

  MovieDetails? get movieDetails => _movieDetails;

  getMovies() async {
    if (!_isLoading) {
      _isLoading = !_isLoading;
      notifyListeners();
      await DioHelper.getData(
          url: 'movie/popular',
          query: {'api_key': apiKey, 'page': _page}).then((value) {
        _page++;
        _moviesResponse = MoviesResponse.fromJson(value.data);
        _movies.addAll(_moviesResponse!.movies!);
        notifyListeners();
      }).catchError((e) {
        if (kDebugMode) {
          print(e.toString());
        }
      });
      _isLoading = !_isLoading;
      notifyListeners();
    }
  }

  getMovieDetails(int id) async {
    _movieDetails = null;
    await DioHelper.getData(url: 'movie/$id', query: {'api_key': apiKey})
        .then((value) {
      _movieDetails = MovieDetails.fromJson(value.data);
      notifyListeners();
    }).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
    });
  }
}