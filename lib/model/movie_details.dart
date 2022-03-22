import 'Genre.dart';
import 'ProductionCompany.dart';
import 'ProductionCountry.dart';
import 'SpokenLanguage.dart';

class MovieDetails {
    bool? adult;
    String? backdropPath;
    dynamic belongsToCollection;
    int? budget;
    List<Genre>? genres;
    String? homepage;
    int? id;
    String? imdbId;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String? posterPath;
    List<ProductionCompany>? productionCompanies;
    List<ProductionCountry>? productionCountries;
    String? releaseDate;
    int? revenue;
    int? runtime;
    List<SpokenLanguage>? spokenLanguages;
    String? status;
    String? tagline;
    String? title;
    bool? video;
    double? voteAverage;
    int? voteCount;

    MovieDetails({this.adult, this.backdropPath, this.belongsToCollection, this.budget, this.genres, this.homepage, this.id, this.imdbId, this.originalLanguage, this.originalTitle, this.overview, this.popularity, this.posterPath, this.productionCompanies, this.productionCountries, this.releaseDate, this.revenue, this.runtime, this.spokenLanguages, this.status, this.tagline, this.title, this.video, this.voteAverage, this.voteCount});

    factory MovieDetails.fromJson(Map<String, dynamic> json) {
        return MovieDetails(
            adult: json['adult'], 
            backdropPath: json['backdrop_path'],
            belongsToCollection: json['belongs_to_collection'],
            budget: json['budget'], 
            genres: json['genres'] != null ? (json['genres'] as List).map((i) => Genre.fromJson(i)).toList() : null, 
            homepage: json['homepage'], 
            id: json['id'], 
            imdbId: json['imdb_id'],
            originalLanguage: json['original_language'],
            originalTitle: json['original_title'],
            overview: json['overview'], 
            popularity: json['popularity'], 
            posterPath: json['poster_path'],
            productionCompanies: json['production_companies'] != null ? (json['production_companies'] as List).map((i) => ProductionCompany.fromJson(i)).toList() : null,
            productionCountries: json['production_countries'] != null ? (json['production_countries'] as List).map((i) => ProductionCountry.fromJson(i)).toList() : null,
            releaseDate: json['release_date'],
            revenue: json['revenue'], 
            runtime: json['runtime'], 
            spokenLanguages: json['spoken_languages'] != null ? (json['spoken_languages'] as List).map((i) => SpokenLanguage.fromJson(i)).toList() : null,
            status: json['status'], 
            tagline: json['tagline'], 
            title: json['title'], 
            video: json['video'], 
            voteAverage: json['vote_average'],
            voteCount: json['vote_count'],
        );
    }
}