import 'package:movies_app/Movies/domain/entites/movies.dart';

class MoviesModel extends Movies {
const   MoviesModel({
    required super.id,
    required super.voteAverage,
    required super.genreIds,
    required super.overview,
    required super.posterPath,
    required super.title,
    required super.releaseDate,
  });
  
  // List<int>.from(json["genre_ids"]).map((e) => e).toList()
  factory MoviesModel.fromJson(Map<String,dynamic>json)=>MoviesModel(
    id: json["id"],
    voteAverage: json["vote_average"].toDouble(),
    genreIds: List<int>.from((json['genre_ids']).map((e) => e)),
    overview: json['overview'],
    posterPath: json['poster_path'],
    title:json['title'] ,
    releaseDate: json['release_date'],

  );
}
