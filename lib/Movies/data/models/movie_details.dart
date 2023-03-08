import 'package:movies_app/Movies/data/models/genres_model.dart';
import '../../domain/entites/movie_details.dart';
class MoviesDetailsModel extends MovieDetails {
  const MoviesDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.genres,
    required super.overview,
    required super.runtime,
    required super.title,
    required super.voteAverage,
    required super.releaseDate,
    
  });

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) => MoviesDetailsModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        genres: List.from((json["genres"]).map((e) => GenresModel.fromJson(e))),
        overview: json["overview"],
        runtime: json["runtime"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        releaseDate:  json["release_date"] ,
      );
}
