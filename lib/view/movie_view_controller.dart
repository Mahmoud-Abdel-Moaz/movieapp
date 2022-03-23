import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/movie.dart';
import '../model/movie_details.dart';
import '../model/movies_response.dart';
import '../shared/constants.dart';

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
      try {
        String url = baseUrl + 'movie/popular?api_key=$apiKey&page=$_page';
        final response = await http.get(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
        );
        if (kDebugMode) {
          log("headers  " + response.body);
          log("response " + response.body);
        }
        if (response.statusCode == 200) {
          _isLoading = !_isLoading;
          _page++;
          _moviesResponse = MoviesResponse.fromJson(jsonDecode(response.body));
          _movies.addAll(_moviesResponse!.movies!);
          notifyListeners();
        } else {
          throw response.body;
        }
      } catch (e) {
        _isLoading = !_isLoading;
        notifyListeners();
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
  }

  getMovieDetails(int id) async {
    _movieDetails = null;
    try {
      String url = baseUrl + 'movie/$id?api_key=$apiKey';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (kDebugMode) {
        log("headers  " + response.body);
        log("response " + response.body);
      }
      if (response.statusCode == 200) {
        _movieDetails = MovieDetails.fromJson(jsonDecode(response.body));
        notifyListeners();
      } else {
        throw response.body;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}