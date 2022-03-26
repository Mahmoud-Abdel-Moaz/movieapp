import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/movies_response.dart';
import 'movie_view_controller.dart';
import 'movie_view_item.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({Key? key}) : super(key: key);

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  var _controller = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).getMovies();
    _controller = ScrollController()
      ..addListener(() {
        if (_controller.position.atEdge) {
          if (_controller.position.maxScrollExtent == _controller.offset) {
            Provider.of<MovieProvider>(context, listen: false).getMovies();
          }
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MovieProvider _movieProvider = Provider.of<MovieProvider>(context);
    MoviesResponse? _moviesResponse = _movieProvider.moviesResponse;
    _isLoading = _movieProvider.isLoading;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Movies App',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _moviesResponse != null
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      controller: _controller,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          MovieViewItem(_movieProvider.movies[index]),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: _movieProvider.movies.length,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (_isLoading) const LinearProgressIndicator(),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
