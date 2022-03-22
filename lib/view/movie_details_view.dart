import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/movie_details.dart';
import '../shared/components/constants.dart';
import 'movie_view_controller.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {

  @override
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).getMovieDetails(
        widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MovieProvider movieProvider = Provider.of<MovieProvider>(context);
    MovieDetails? movieDetails = movieProvider.movieDetails;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: movieDetails != null ? SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              baseImagePath + movieDetails.backdropPath!, fit: BoxFit.cover,
              width: double.infinity,),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(movieDetails.title!, style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),),
            ),
            const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(movieDetails.overview!, style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),),
            ),

          ],
        ),
      ) : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
