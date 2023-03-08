import '../../domain/entites/movie_recommendtion.dart';

class MovieRecommedtionModel extends MovieRecommedtion {
  const MovieRecommedtionModel(
      {required super.id,  super.backdropPath});
  factory MovieRecommedtionModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommedtionModel(
          id: json["id"],
          backdropPath:
              json["backdrop_path"] ?? "/n2KH5TlEcYPvinmwsJj4ULc1xDO.jpg");
}
