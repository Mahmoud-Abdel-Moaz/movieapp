import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'movie_view_controller.dart';
import 'movie_view_item.dart';
import 'package:provider/provider.dart';

import '../model/movie.dart';
import '../model/movies_response.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({Key? key}) : super(key: key);

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  @override
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MovieProvider _movieProvider = Provider.of<MovieProvider>(context);
    MoviesResponse? _moviesResponse = _movieProvider.moviesResponse;
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
          ? ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            MovieViewItem(_moviesResponse.movies![index]),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: _moviesResponse.movies!.length,
      )/*Container(

            child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                        child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          MovieViewItem(_moviesResponse.movies![index]),
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemCount: _moviesResponse.movies!.length,
                    )),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
          )*/
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
