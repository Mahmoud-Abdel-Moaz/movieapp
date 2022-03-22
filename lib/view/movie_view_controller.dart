import 'dart:developer';

import 'package:flutter/material.dart';
import '../model/movies_response.dart';
import '../shared/components/constants.dart';
import '../shared/network/remote/dio_helper.dart';
import '../model/movie.dart';

class MovieProvider with ChangeNotifier{
  MoviesResponse? _moviesResponse;
  MoviesResponse? get moviesResponse=>_moviesResponse;
  final List<Movie> _movies=[];
  List<Movie> get movies=>_movies;
  bool _isLoading=false;
  bool get isLoading=>_isLoading;
  int _page=1;

  getMovies()async{
    if(!_isLoading) {
      _isLoading=!_isLoading;
     // notifyListeners();
      await DioHelper.getData(
              url: 'movie/popular', query: {'api_key': apiKey, 'page': _page})
          .then((value) {
            log(value.data.toString());
            _page++;
            _moviesResponse=MoviesResponse.fromJson(value.data);
            _movies.addAll(_moviesResponse!.movies!);
            notifyListeners();
      })
          .catchError((e) {
          print(e.toString());
      });
      _isLoading=!_isLoading;
      notifyListeners();
    }
  }
  
}