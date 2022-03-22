class Movie {
    bool? adult;
    String? backdropPath;
    List<int>? genreIds;
    int? id;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    dynamic popularity;
    String? posterPath;
    String? releaseDate;
    String? title;
    bool? video;
    dynamic voteAverage;
    int? voteCount;

    Movie({this.adult, this.backdropPath, this.genreIds, this.id, this.originalLanguage, this.originalTitle, this.overview, this.popularity, this.posterPath, this.releaseDate, this.title, this.video, this.voteAverage, this.voteCount});

    factory Movie.fromJson(Map<String, dynamic> json) {
        return Movie(
            adult: json['adult'], 
            backdropPath: json['backdrop_path'],
            genreIds: json['genre_ids'] != null ?  List<int>.from(json['genre_ids']) : null,
            id: json['id'], 
            originalLanguage: json['original_language'],
            originalTitle: json['original_title'],
            overview: json['overview'], 
            popularity: json['popularity'], 
            posterPath: json['poster_path'],
            releaseDate: json['release_date'],
            title: json['title'], 
            video: json['video'], 
            voteAverage: json['vote_average'],
            voteCount: json['vote_count'],
        );
    }
}